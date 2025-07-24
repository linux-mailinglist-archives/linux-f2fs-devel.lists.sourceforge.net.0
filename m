Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEFCB10794
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Jul 2025 12:18:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QDSQr5S4VDgNkK0SYeo2SuYP8A1yW+0DLOOhVFaXLnk=; b=UkZY9ASzrL8MwnRiztZb7PVUxk
	N12okVxCeAynwVHXf7bPXTcPyiPAzmZoZagfcwfxacg6AqHHUxxRLdJnjxoOo7Q8lbdQq6lh+Es0y
	M6xQbYnwnHtZWkmFa18a04Wds2SFE99JDWxsNIZq1BL2NQPhBdI1rw65xD2AYLwkXyw4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uet22-0007ik-7x;
	Thu, 24 Jul 2025 10:18:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lee@kernel.org>) id 1uet20-0007id-Uw
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 10:18:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L6uwJVRafW2h2JlYAxIMjWpRyT0FUZdPIIbrPy5Lnvw=; b=byJBjHC70DXD6TsLSIFn16gkUN
 Po+lkOwQl83HSQnC6qHqt4n9UlNfQqNFvipPtQUb9bH2s7ayeCKPQiP7FHNkFrB4X3p+BRZq7PtcV
 60eQkAYTfSVcODK6pNcYRUplW93m/i1oWGoh7+2GLptQTOxZLUoUzd2DF0I97bi41GwM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L6uwJVRafW2h2JlYAxIMjWpRyT0FUZdPIIbrPy5Lnvw=; b=FWKD/TOQH/xT3PICY3F3DMjhBB
 cMkLzgCiYfiDZcWL0RkRKTShmnLwLTR46CDP3CpeQHMh4/nFK2ls+a+GTCTfhJDsbZeSOmsNQ4+cG
 JE6c9jrNNeLYb9ipNWB5Znc2evHUnWoWY/Tn1KdUpKs63Loyx8I04cgVPQe7WFl9dE9I=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uet20-0004VI-Fs for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 10:18:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2092145405;
 Thu, 24 Jul 2025 10:18:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 738A8C4CEED;
 Thu, 24 Jul 2025 10:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753352302;
 bh=kxNbWmvGgnDYGDeo1gboZY2VzKiJaS/yvAS02FMDsno=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qhZT44thqgQVxJ9rRh0LLiA8wFQN8Uwt2NBlm3NvZilVQm7fyVM4foN38zUsSHMD/
 z9GO9ba57JpR+ZIWxolyviW9NFX+c/YauCU1Qw8LTlnHhGX0/ixPAO502tVQEK+bY/
 Rny13nIhUvKk4ISHPuJO0JNtgqMHROkqAgFWejWfKyzCqk5mYARBZx9iCQ0uObBB1u
 i9vb4XE6w+DiquOhNENj9cdKwE1R4TcIZIoULdxRexeQ9QECa78EO+mAKw8Gyloe8d
 ZEbl6+NigcGM5FkXjuQjExv0+cEgYXsGzK2qOvRruDKMJLjPFgfhM40QGy3xxgzco4
 xfY+uuWWKloZg==
Date: Thu, 24 Jul 2025 11:18:17 +0100
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20250724101817.GZ11056@google.com>
References: <20250416054805.1416834-1-chao@kernel.org>
 <20250624100039.GA3680448@google.com>
 <2025070253-erased-armadillo-0984@gregkh>
 <20250723082639.GP11056@google.com>
 <2025072354-tricolor-annex-92fb@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2025072354-tricolor-annex-92fb@gregkh>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 23 Jul 2025, Greg Kroah-Hartman wrote: > On Wed, Jul
 23, 2025 at 09:26:39AM +0100, Lee Jones wrote: > > On Wed, 02 Jul 2025, Greg
 Kroah-Hartman wrote: > > > > > On Tue, Jun 24, 2025 at 11:00:39AM +0100,
 Lee Jones wrote: > > > > On Wed, 16 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uet20-0004VI-Fs
Subject: Re: [f2fs-dev] [STABLE 5.15+] f2fs: sysfs: add encoding_flags entry
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
From: Lee Jones via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Lee Jones <lee@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCAyMyBKdWwgMjAyNSwgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOgoKPiBPbiBXZWQs
IEp1bCAyMywgMjAyNSBhdCAwOToyNjozOUFNICswMTAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiBP
biBXZWQsIDAyIEp1bCAyMDI1LCBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6Cj4gPiAKPiA+ID4g
T24gVHVlLCBKdW4gMjQsIDIwMjUgYXQgMTE6MDA6MzlBTSArMDEwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+ID4gPiA+IE9uIFdlZCwgMTYgQXByIDIwMjUsIENoYW8gWXUgd3JvdGU6Cj4gPiA+ID4gCj4g
PiA+ID4gPiBUaGlzIHBhdGNoIGFkZHMgYSBuZXcgc3lzZnMgZW50cnkgL3N5cy9mcy9mMmZzLzxk
aXNrPi9lbmNvZGluZ19mbGFncywKPiA+ID4gPiA+IGl0IGlzIGEgcmVhZC1vbmx5IGVudHJ5IHRv
IHNob3cgdGhlIHZhbHVlIG9mIHNiLnNfZW5jb2RpbmdfZmxhZ3MsIHRoZQo+ID4gPiA+ID4gdmFs
dWUgaXMgaGV4YWRlY2ltYWwuCj4gPiA+ID4gPiAKPiA+ID4gPiA+ID09PT09PT09PT09PT09PT09
PT09PT09PT09PSAgICAgID09PT09PT09PT0KPiA+ID4gPiA+IEZsYWdfTmFtZSAgICAgICAgICAg
ICAgICAgICAgICAgIEZsYWdfVmFsdWUKPiA+ID4gPiA+ID09PT09PT09PT09PT09PT09PT09PT09
PT09PSAgICAgID09PT09PT09PT0KPiA+ID4gPiA+IFNCX0VOQ19TVFJJQ1RfTU9ERV9GTCAgICAg
ICAgICAgIDB4MDAwMDAwMDEKPiA+ID4gPiA+IFNCX0VOQ19OT19DT01QQVRfRkFMTEJBQ0tfRkwg
ICAgIDB4MDAwMDAwMDIKPiA+ID4gPiA+ID09PT09PT09PT09PT09PT09PT09PT09PT09PSAgICAg
ID09PT09PT09PT0KPiA+ID4gPiA+IAo+ID4gPiA+ID4gY2FzZSMxCj4gPiA+ID4gPiBta2ZzLmYy
ZnMgLWYgLU8gY2FzZWZvbGQgLUMgdXRmODpzdHJpY3QgL2Rldi92ZGEKPiA+ID4gPiA+IG1vdW50
IC9kZXYvdmRhIC9tbnQvZjJmcwo+ID4gPiA+ID4gY2F0IC9zeXMvZnMvZjJmcy92ZGEvZW5jb2Rp
bmdfZmxhZ3MKPiA+ID4gPiA+IDEKPiA+ID4gPiA+IAo+ID4gPiA+ID4gY2FzZSMyCj4gPiA+ID4g
PiBta2ZzLmYyZnMgLWYgLU8gY2FzZWZvbGQgLUMgdXRmOCAvZGV2L3ZkYQo+ID4gPiA+ID4gZnNj
ay5mMmZzIC0tbm9saW5lYXItbG9va3VwPTEgL2Rldi92ZGEKPiA+ID4gPiA+IG1vdW50IC9kZXYv
dmRhIC9tbnQvZjJmcwo+ID4gPiA+ID4gY2F0IC9zeXMvZnMvZjJmcy92ZGEvZW5jb2RpbmdfZmxh
Z3MKPiA+ID4gPiA+IDIKPiA+ID4gPiA+IAo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZ
dSA8Y2hhb0BrZXJuZWwub3JnPgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiAgRG9jdW1lbnRhdGlv
bi9BQkkvdGVzdGluZy9zeXNmcy1mcy1mMmZzIHwgMTMgKysrKysrKysrKysrKwo+ID4gPiA+ID4g
IGZzL2YyZnMvc3lzZnMuYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICA5ICsrKysrKysrKwo+
ID4gPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQo+ID4gPiA+IAo+ID4g
PiA+IFRoaXMgcGF0Y2gsIGNvbW1pdCA2MTdlMDQ5MWFiZTQgKCJmMmZzOiBzeXNmczogZXhwb3J0
IGxpbmVhcl9sb29rdXAgaW4KPiA+ID4gPiBmZWF0dXJlcyBkaXJlY3RvcnkiKSB1cHN0cmVhbSwg
bmVlZHMgdG8gZmluZCBpdHMgd2F5IGludG8gYWxsIFN0YWJsZQo+ID4gPiA+IGJyYW5jaGVzIGNv
bnRhaW5pbmcgdXBzdHJlYW0gY29tbWl0IDkxYjU4N2JhNzllMSAoImYyZnM6IEludHJvZHVjZQo+
ID4gPiA+IGxpbmVhciBzZWFyY2ggZm9yIGRlbnRyaWVzIiksIHdoaWNoIGlzIGVzc2VudGlhbGx5
IGxpbnV4LTUuMTUueSBhbmQKPiA+ID4gPiBuZXdlci4KPiA+ID4gPiAKPiA+ID4gPiBzdGFibGUv
bGludXgtNS40Lnk6Cj4gPiA+ID4gTUlTU0lORzogICAgIGYyZnM6IEludHJvZHVjZSBsaW5lYXIg
c2VhcmNoIGZvciBkZW50cmllcwo+ID4gPiA+IE1JU1NJTkc6ICAgICBmMmZzOiBzeXNmczogZXhw
b3J0IGxpbmVhcl9sb29rdXAgaW4gZmVhdHVyZXMgZGlyZWN0b3J5Cj4gPiA+ID4gCj4gPiA+ID4g
c3RhYmxlL2xpbnV4LTUuMTAueToKPiA+ID4gPiBNSVNTSU5HOiAgICAgZjJmczogSW50cm9kdWNl
IGxpbmVhciBzZWFyY2ggZm9yIGRlbnRyaWVzCj4gPiA+ID4gTUlTU0lORzogICAgIGYyZnM6IHN5
c2ZzOiBleHBvcnQgbGluZWFyX2xvb2t1cCBpbiBmZWF0dXJlcyBkaXJlY3RvcnkKPiA+ID4gPiAK
PiA+ID4gPiBzdGFibGUvbGludXgtNS4xNS55Ogo+ID4gPiA+IGIwOTM4ZmZkMzlhZSBmMmZzOiBJ
bnRyb2R1Y2UgbGluZWFyIHNlYXJjaCBmb3IgZGVudHJpZXMgWzUuMTUuMTc5XQo+ID4gPiA+IE1J
U1NJTkc6ICAgICBmMmZzOiBzeXNmczogZXhwb3J0IGxpbmVhcl9sb29rdXAgaW4gZmVhdHVyZXMg
ZGlyZWN0b3J5Cj4gPiA+ID4gCj4gPiA+ID4gc3RhYmxlL2xpbnV4LTYuMS55Ogo+ID4gPiA+IGRl
NjA1MDk3ZWIxNyBmMmZzOiBJbnRyb2R1Y2UgbGluZWFyIHNlYXJjaCBmb3IgZGVudHJpZXMgWzYu
MS4xMjldCj4gPiA+ID4gTUlTU0lORzogICAgIGYyZnM6IHN5c2ZzOiBleHBvcnQgbGluZWFyX2xv
b2t1cCBpbiBmZWF0dXJlcyBkaXJlY3RvcnkKPiA+ID4gPiAKPiA+ID4gPiBzdGFibGUvbGludXgt
Ni42Lnk6Cj4gPiA+ID4gMGJmMmFkYWQwM2UxIGYyZnM6IEludHJvZHVjZSBsaW5lYXIgc2VhcmNo
IGZvciBkZW50cmllcyBbNi42Ljc2XQo+ID4gPiA+IE1JU1NJTkc6ICAgICBmMmZzOiBzeXNmczog
ZXhwb3J0IGxpbmVhcl9sb29rdXAgaW4gZmVhdHVyZXMgZGlyZWN0b3J5Cj4gPiA+ID4gCj4gPiA+
ID4gc3RhYmxlL2xpbnV4LTYuMTIueToKPiA+ID4gPiAwMGQxOTQzZmU0NmQgZjJmczogSW50cm9k
dWNlIGxpbmVhciBzZWFyY2ggZm9yIGRlbnRyaWVzIFs2LjEyLjEzXQo+ID4gPiA+IE1JU1NJTkc6
ICAgICBmMmZzOiBzeXNmczogZXhwb3J0IGxpbmVhcl9sb29rdXAgaW4gZmVhdHVyZXMgZGlyZWN0
b3J5Cj4gPiA+ID4gCj4gPiA+ID4gbWFpbmxpbmU6Cj4gPiA+ID4gOTFiNTg3YmE3OWUxIGYyZnM6
IEludHJvZHVjZSBsaW5lYXIgc2VhcmNoIGZvciBkZW50cmllcwo+ID4gPiA+IDYxN2UwNDkxYWJl
NCBmMmZzOiBzeXNmczogZXhwb3J0IGxpbmVhcl9sb29rdXAgaW4gZmVhdHVyZXMgZGlyZWN0b3J5
Cj4gPiA+IAo+ID4gPiBHcmVhdCwgdGhlbiBjYW4gc29tZW9uZSBzdWJtaXQgdGhlc2UgaW4gYSBm
b3JtYXQgd2UgY2FuIGFwcGx5IHRoZW0gaW4/Cj4gPiA+IG9yIGRvIGNsZWFuIGNoZXJyeS1waWNr
cyB3b3JrIHByb3Blcmx5Pwo+ID4gCj4gPiBEb2VzIHRoaXMgd29yazoKPiA+IAo+ID4gUGxlYXNl
IGJhY2twb3J0IHVwc3RyZWFtIGNvbW1pdDoKPiA+IAo+ID4gICA2MTdlMDQ5MWFiZTQgZjJmczog
c3lzZnM6IGV4cG9ydCBsaW5lYXJfbG9va3VwIGluIGZlYXR1cmVzIGRpcmVjdG9yeQo+ID4gCj4g
PiAuLi4gdG8gYWxsIHN0YWJsZSBicmFuY2hlcyB1cCB0byBhbmQgaW5jbHVkaW5nIGxpbnV4LTUu
MTUueS4KPiA+IAo+ID4gSWYgdGhlcmUgYXJlIGNvbmZsaWN0cywgSSBjYW4gZG8gdGhlIGJhY2tw
b3J0IG15c2VsZiBhbmQgc3VibWl0IGFzIHBhdGNoZXMuCj4gCj4gVGhlcmUgYXJlIGNvbmZsaWN0
cywgaXQgZG9lc24ndCBhcHBseSB0byA2LjEueSBvciA1LjE1LnkgOigKCk9rYXksIHRoYW5rcyBm
b3IgdHJ5aW5nLiAgTGVhdmUgaXQgd2l0aCBtZS4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCg==
