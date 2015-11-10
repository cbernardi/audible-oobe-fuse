using Uno;
using Uno.Collections;
using Fuse.Scripting;
using Fuse.Reactive;

using Android.android.media;
using Android.android.app;
using iOS.AudioToolbox;

public class PlaySample : NativeModule
{
    public PlaySample()
    {
        AddMember(new NativeFunction("samplePlayback", 
            (NativeCallback)SamplePlayback));
        AddMember(new NativeFunction("stopPlayback", 
            (NativeCallback)StopPlayback));
    }
// Start sample play
    object SamplePlayback(Context c, object[] args)
    {
        if defined(iOS) 
        {
            Functions.AudioServicesPlaySystemSound(1310);
        }

        else if defined(Android) 
        {
            String url = "https://d3dqntzfhcgpyw.cloudfront.net/bk/aren/001960/bk_aren_001960_sample.mp3"; // your URL here
            MediaPlayer mediaPlayer = new MediaPlayer();
            mediaPlayer.setAudioStreamType(AudioManager.STREAM_MUSIC);
            mediaPlayer.setDataSource(url);
            mediaPlayer.prepare(); // might take long! (for buffering, etc)
            mediaPlayer.start();
        }

        debug_log("Sample played!");

        return null;
    }
// Stop sample playback
    object StopPlayback(Context c, object[] args)
    {
        if defined(iOS) 
        {
            Functions.AudioServicesPlaySystemSound(1310);
        }

        else if defined(Android) 
        {
            MediaPlayer mediaPlayer = new MediaPlayer();
            mediaPlayer.stop();
        }

        debug_log("Sample stopped!");

        return null;
    }
}