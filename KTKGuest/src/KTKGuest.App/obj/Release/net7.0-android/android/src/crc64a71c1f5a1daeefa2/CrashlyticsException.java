package crc64a71c1f5a1daeefa2;


public class CrashlyticsException
	extends java.lang.Exception
	implements
		mono.android.IGCUserPeer
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"";
		mono.android.Runtime.register ("Plugin.Firebase.Crashlytics.CrashlyticsException, Plugin.Firebase", CrashlyticsException.class, __md_methods);
	}


	public CrashlyticsException (java.lang.String p0)
	{
		super (p0);
		if (getClass () == CrashlyticsException.class) {
			mono.android.TypeManager.Activate ("Plugin.Firebase.Crashlytics.CrashlyticsException, Plugin.Firebase", "System.String, System.Private.CoreLib", this, new java.lang.Object[] { p0 });
		}
	}

	private java.util.ArrayList refList;
	public void monodroidAddReference (java.lang.Object obj)
	{
		if (refList == null)
			refList = new java.util.ArrayList ();
		refList.add (obj);
	}

	public void monodroidClearReferences ()
	{
		if (refList != null)
			refList.clear ();
	}
}
