Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 928DFAFFE85
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Jul 2025 11:55:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a4rr5SLIx2AuqIMthp3G9j0XNSJutDO8Q17mZmdq+cg=; b=eglMcWbfDDgfnGCe++HeRtbWdo
	ElOIMiehZ+U23lrhvSam7NAmd6pwXDD7Tp6gJ3f2rhSKQLXKblgQu2sQoX3Cad1D0Stk1JHnU6Zwb
	o/wEdPkwW3TElCM/WRcZAwpNKmJjwV9hLKG+nq4gaRz6hQI/gy2O5Js7jFfoKBzLz6g8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZnzw-00038b-GT;
	Thu, 10 Jul 2025 09:55:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <quwenruo.btrfs@gmx.com>) id 1uZnzu-00038N-UV
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Jul 2025 09:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aR7vXnpCePeT/rE72CbwBDX2iPnDc0SYSzqKSb+99mo=; b=OTBrKk9cX4hEYjZCQg7hfSWyWl
 wkjNOZEEpnZGtT1N2p2XxGHBxwYZxZMpgBX5lg7d6WuLGSQVZ8nwpfUJNq7+4ty4MfzFxyeZP+RRB
 QoIyFkOWvbYCTrGL0V3nbPuiV8A82mUCVShBXfusLmytfVp1SWznsHcd7ILJ93/WpsoE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aR7vXnpCePeT/rE72CbwBDX2iPnDc0SYSzqKSb+99mo=; b=Ei1wBmHwPH1pPFF49+z7WYzxtt
 yUPxIMEZ7bGLFoiPZQ3ceE2Zsny5K8J5dY1qctC61H6CwdAo4xbITPf/fB+Gw5jDrcV/raQNASAMQ
 71L+8vdhntEQN3r175A/+Dcw7x8DeHXHCpX2Yzh3J4AQ9+I+/pMePhYwkSPZOWXDbVrA=;
Received: from mout.gmx.net ([212.227.17.21])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZnzt-0001vN-Rl for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Jul 2025 09:55:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
 s=s31663417; t=1752141300; x=1752746100; i=quwenruo.btrfs@gmx.com;
 bh=aR7vXnpCePeT/rE72CbwBDX2iPnDc0SYSzqKSb+99mo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=tbG8CSmElvb/jdsqnNKFpxQgJJsSHIAE48BWVajnLAAj4Ev8QLYcrqMynTIC7Oe9
 Rqryg0pYKffdQcg9lSxfeWrkHbXOZs1A4sgKii3aghuarOAX2QHCh48d6/mSYMoRy
 c13cR1pvZvTj1zzWmz0PKVZm2tm1O3cs8A6UYQNWO8lqivz720QyGTBpg1fBQ2XiS
 7ySQK1Old2eIeA0KyiWTfwACEUZLY9zezjFyFo6TmIAQ2ESQySgKtpdcI01y/cedY
 bqyRZy3L+ZR1vNOfr6AwyHj+19wdCMEsEc0s9t2V+JikrTuKlg8a+yZ/D8vhlx7yU
 /bcDKN4rdmD2v6fr+A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.0.219] ([159.196.52.54]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MFsUp-1uRJvg2l6V-005qzo; Thu, 10
 Jul 2025 11:55:00 +0200
Message-ID: <9bce3d22-5ea2-4a95-9a7e-fc391ae9a2b6@gmx.com>
Date: Thu, 10 Jul 2025 19:24:46 +0930
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christian Brauner <brauner@kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>
References: <cover.1751589725.git.wqu@suse.com>
 <de25bbdb572c75df38b1002d3779bf19e3ad0ff6.1751589725.git.wqu@suse.com>
 <aGxSHKeyldrR1Q0T@dread.disaster.area>
 <dbd955f7-b9b4-402f-97bf-6b38f0c3237e@gmx.com>
 <20250708004532.GA2672018@frogsfrogsfrogs>
 <2dm6bsup7vxwl4vwmllkvt5erncirr272bov4ehd5gix7n2vnw@bkagb26tjtj5>
 <20250708202050.GG2672049@frogsfrogsfrogs>
 <20250710-sitzung-gelaufen-4ee804949772@brauner>
Content-Language: en-US
Autocrypt: addr=quwenruo.btrfs@gmx.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNIlF1IFdlbnJ1byA8cXV3ZW5ydW8uYnRyZnNAZ214LmNvbT7CwJQEEwEIAD4CGwMFCwkI
 BwIGFQgJCgsCBBYCAwECHgECF4AWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCZxF1YAUJEP5a
 sQAKCRDCPZHzoSX+qF+mB/9gXu9C3BV0omDZBDWevJHxpWpOwQ8DxZEbk9b9LcrQlWdhFhyn
 xi+l5lRziV9ZGyYXp7N35a9t7GQJndMCFUWYoEa+1NCuxDs6bslfrCaGEGG/+wd6oIPb85xo
 naxnQ+SQtYLUFbU77WkUPaaIU8hH2BAfn9ZSDX9lIxheQE8ZYGGmo4wYpnN7/hSXALD7+oun
 tZljjGNT1o+/B8WVZtw/YZuCuHgZeaFdhcV2jsz7+iGb+LsqzHuznrXqbyUQgQT9kn8ZYFNW
 7tf+LNxXuwedzRag4fxtR+5GVvJ41Oh/eygp8VqiMAtnFYaSlb9sjia1Mh+m+OBFeuXjgGlG
 VvQFzsBNBFnVga8BCACqU+th4Esy/c8BnvliFAjAfpzhI1wH76FD1MJPmAhA3DnX5JDORcga
 CbPEwhLj1xlwTgpeT+QfDmGJ5B5BlrrQFZVE1fChEjiJvyiSAO4yQPkrPVYTI7Xj34FnscPj
 /IrRUUka68MlHxPtFnAHr25VIuOS41lmYKYNwPNLRz9Ik6DmeTG3WJO2BQRNvXA0pXrJH1fN
 GSsRb+pKEKHKtL1803x71zQxCwLh+zLP1iXHVM5j8gX9zqupigQR/Cel2XPS44zWcDW8r7B0
 q1eW4Jrv0x19p4P923voqn+joIAostyNTUjCeSrUdKth9jcdlam9X2DziA/DHDFfS5eq4fEv
 ABEBAAHCwHwEGAEIACYCGwwWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCZxF1gQUJEP5a0gAK
 CRDCPZHzoSX+qHGpB/kB8A7M7KGL5qzat+jBRoLwB0Y3Zax0QWuANVdZM3eJDlKJKJ4HKzjo
 B2Pcn4JXL2apSan2uJftaMbNQbwotvabLXkE7cPpnppnBq7iovmBw++/d8zQjLQLWInQ5kNq
 Vmi36kmq8o5c0f97QVjMryHlmSlEZ2Wwc1kURAe4lsRG2dNeAd4CAqmTw0cMIrR6R/Dpt3ma
 +8oGXJOmwWuDFKNV4G2XLKcghqrtcRf2zAGNogg3KulCykHHripG3kPKsb7fYVcSQtlt5R6v
 HZStaZBzw4PcDiaAF3pPDBd+0fIKS6BlpeNRSFG94RYrt84Qw77JWDOAZsyNfEIEE0J6LSR/
In-Reply-To: <20250710-sitzung-gelaufen-4ee804949772@brauner>
X-Provags-ID: V03:K1:Zk/p0EZft3KrOgVt/nIdYjYIWl4uxNLAUTaU28CGhNHADEN8Xwc
 LIt3HWN00a8X+SmFKF+Nv/Tc72dJnAyqikjcWphxEhqHIAaI+JYUbV5SRncKHjvU0mNMtnk
 /hBIGgNkzShL/SLmAOjTykg3dP6TycQiScfYF9OiwtM75F8ujgunAko55zoZRGZ24Wp2FcD
 eL5Ym8R5+sc3ry0clxx8Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9ifGE7fFVRM=;YBkCltU6DVBZBukXR8SicoJuadT
 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
 B6/QvLIQLd9CZsiNEK/jIAo=
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2025/7/10 18:10, Christian Brauner 写道: > On Tue,
   Jul 08, 2025 at 01:20:50PM -0700, Darrick J. Wong wrote: >> On Tue, Jul 08,
    2025 at 12:20:00PM +0200, Jan Kara wrote: >>> On Mon 07-07-25 17:45 [...]
    
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [quwenruo.btrfs(at)gmx.com]
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was blocked.
                             See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URI: gmx.com]
  0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
                             [212.227.17.21 listed in wl.mailspike.net]
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uZnzt-0001vN-Rl
Subject: Re: [f2fs-dev] [PATCH v4 1/6] fs: enhance and rename shutdown()
 callback to remove_bdev()
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
From: Qu Wenruo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: ntfs3@lists.linux.dev, Jan Kara <jack@suse.cz>,
 Dave Chinner <david@fromorbit.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Qu Wenruo <wqu@suse.com>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org, viro@zeniv.linux.org.uk
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgrlnKggMjAyNS83LzEwIDE4OjEwLCBDaHJpc3RpYW4gQnJhdW5lciDlhpnpgZM6Cj4gT24gVHVl
LCBKdWwgMDgsIDIwMjUgYXQgMDE6MjA6NTBQTSAtMDcwMCwgRGFycmljayBKLiBXb25nIHdyb3Rl
Ogo+PiBPbiBUdWUsIEp1bCAwOCwgMjAyNSBhdCAxMjoyMDowMFBNICswMjAwLCBKYW4gS2FyYSB3
cm90ZToKPj4+IE9uIE1vbiAwNy0wNy0yNSAxNzo0NTozMiwgRGFycmljayBKLiBXb25nIHdyb3Rl
Ogo+Pj4+IE9uIFR1ZSwgSnVsIDA4LCAyMDI1IGF0IDA4OjUyOjQ3QU0gKzA5MzAsIFF1IFdlbnJ1
byB3cm90ZToKPj4+Pj4g5ZyoIDIwMjUvNy84IDA4OjMyLCBEYXZlIENoaW5uZXIg5YaZ6YGTOgo+
Pj4+Pj4gT24gRnJpLCBKdWwgMDQsIDIwMjUgYXQgMTA6MTI6MjlBTSArMDkzMCwgUXUgV2VucnVv
IHdyb3RlOgo+Pj4+Pj4+IEN1cnJlbnRseSBhbGwgdGhlIGZpbGVzeXN0ZW1zIGltcGxlbWVudGlu
ZyB0aGUKPj4+Pj4+PiBzdXBlcl9vcGVhcmF0aW9uczo6c2h1dGRvd24oKSBjYWxsYmFjayBjYW4g
bm90IGFmZm9yZCBsb3NpbmcgYSBkZXZpY2UuCj4+Pj4+Pj4KPj4+Pj4+PiBUaHVzIGZzX2JkZXZf
bWFya19kZWFkKCkgd2lsbCBqdXN0IGNhbGwgdGhlIHNodXRkb3duKCkgY2FsbGJhY2sgZm9yIHRo
ZQo+Pj4+Pj4+IGludm9sdmVkIGZpbGVzeXN0ZW0uCj4+Pj4+Pj4KPj4+Pj4+PiBCdXQgaXQgd2ls
bCBubyBsb25nZXIgYmUgdGhlIGNhc2UsIHdpdGggbXVsdGktZGV2aWNlIGZpbGVzeXN0ZW1zIGxp
a2UKPj4+Pj4+PiBidHJmcyBhbmQgYmNhY2hlZnMgdGhlIGZpbGVzeXN0ZW0gY2FuIGhhbmRsZSBj
ZXJ0YWluIGRldmljZSBsb3NzIHdpdGhvdXQKPj4+Pj4+PiBzaHV0dGluZyBkb3duIHRoZSB3aG9s
ZSBmaWxlc3lzdGVtLgo+Pj4+Pj4+Cj4+Pj4+Pj4gVG8gYWxsb3cgdGhvc2UgbXVsdGktZGV2aWNl
IGZpbGVzeXN0ZW1zIHRvIGJlIGludGVncmF0ZWQgdG8gdXNlCj4+Pj4+Pj4gZnNfaG9sZGVyX29w
czoKPj4+Pj4+Pgo+Pj4+Pj4+IC0gUmVwbGFjZSBzdXBlcl9vcGVhcmF0aW9uOjpzaHV0ZG93bigp
IHdpdGgKPj4+Pj4+PiAgICAgc3VwZXJfb3BlYXJhdGlvbnM6OnJlbW92ZV9iZGV2KCkKPj4+Pj4+
PiAgICAgVG8gYmV0dGVyIGRlc2NyaWJlIHdoZW4gdGhlIGNhbGxiYWNrIGlzIGNhbGxlZC4KPj4+
Pj4+Cj4+Pj4+PiBUaGlzIGNvbmZsYXRlcyBjYXVzZSB3aXRoIGFjdGlvbi4KPj4+Pj4+Cj4+Pj4+
PiBUaGUgc2h1dGRvd24gY2FsbG91dCBpcyBhbiBhY3Rpb24gdGhhdCB0aGUgZmlsZXN5c3RlbSBt
dXN0IGV4ZWN1dGUsCj4+Pj4+PiB3aGlsc3QgInJlbW92ZSBiZGV2IiBpcyBhIGNhdXNlIG5vdGlm
aWNhdGlvbiB0aGF0IG1pZ2h0IHJlcXVpcmUgYW4KPj4+Pj4+IGFjdGlvbiB0byBiZSB0YWtlLgo+
Pj4+Pj4KPj4+Pj4+IFllcywgdGhlIGNhdXNlIGNvdWxkIGJlIHNvbWVvbmUgZG9pbmcgaG90LXVu
cGx1ZyBvZiB0aGUgYmxvY2sKPj4+Pj4+IGRldmljZSwgYnV0IGl0IGNvdWxkIGFsc28gYmUgc29t
ZXRoaW5nIGdvaW5nIHdyb25nIGluIHNvZnR3YXJlCj4+Pj4+PiBsYXllcnMgYmVsb3cgdGhlIGZp
bGVzeXN0ZW0uIGUuZy4gZG0tdGhpbnAgaGF2aW5nIGFuIHVucmVjb3ZlcmFibGUKPj4+Pj4+IGNv
cnJ1cHRpb24gb3IgRU5PU1BDIGVycm9ycy4KPj4+Pj4+Cj4+Pj4+PiBXZSBhbHJlYWR5IGhhdmUg
YSAiY2F1c2UiIG5vdGlmaWNhdGlvbjogYmxrX2hvbGRlcl9vcHMtPm1hcmtfZGVhZCgpLgo+Pj4+
Pj4KPj4+Pj4+IFRoZSBnZW5lcmljIGZzIGFjdGlvbiB0aGF0IGlzIHRha2VuIGJ5IHRoaXMgbm90
aWZpY2F0aW9uIGlzCj4+Pj4+PiBmc19iZGV2X21hcmtfZGVhZCgpLiAgVGhhdCBhY3Rpb24gaXMg
dG8gaW52YWxpZGF0ZSBjYWNoZXMgYW5kIHNodXQKPj4+Pj4+IGRvd24gdGhlIGZpbGVzeXN0ZW0u
Cj4+Pj4+Pgo+Pj4+Pj4gYnRyZnMgbmVlZHMgdG8gZG8gc29tZXRoaW5nIGRpZmZlcmVudCB0byBh
IGJsa19ob2xkZXJfb3BzLT5tYXJrX2RlYWQKPj4+Pj4+IG5vdGlmaWNhdGlvbi4gaS5lLiBpdCBu
ZWVkcyBhbiBhY3Rpb24gdGhhdCBpcyBkaWZmZXJlbnQgdG8KPj4+Pj4+IGZzX2JkZXZfbWFya19k
ZWFkKCkuCj4+Pj4+Pgo+Pj4+Pj4gSW5kZWVkLCB0aGlzIGlzIGhvdyBiY2FjaGVmcyBhbHJlYWR5
IGhhbmRsZXMgInNpbmdsZSBkZXZpY2UKPj4+Pj4+IGRpZWQiIGV2ZW50cyBmb3IgbXVsdGktZGV2
aWNlIGZpbGVzeXN0ZW1zIC0gc2VlCj4+Pj4+PiBiY2gyX2ZzX2JkZXZfbWFya19kZWFkKCkuCj4+
Pj4+Cj4+Pj4+IEkgZG8gbm90IHRoaW5rIGl0J3MgdGhlIGNvcnJlY3Qgd2F5IHRvIGdvLCBlc3Bl
Y2lhbGx5IHdoZW4gdGhlcmUgaXMgYWxyZWFkeQo+Pj4+PiBmc19ob2xkZXJfb3BzLgo+Pj4+Pgo+
Pj4+PiBXZSdyZSBhbHdheXMgZ29pbmcgdG93YXJkcyBhIG1vcmUgZ2VuZXJpYyBzb2x1dGlvbiwg
b3RoZXIgdGhhbiBsZXR0aW5nIHRoZQo+Pj4+PiBpbmRpdmlkdWFsIGZzIHRvIGRvIHRoZSBzYW1l
IHRoaW5nIHNsaWdodGx5IGRpZmZlcmVudGx5Lgo+Pj4+Cj4+Pj4gT24gc2Vjb25kIHRob3VnaHQg
LS0gaXQncyB3ZWlyZCB0aGF0IHlvdSdkIGZsdXNoIHRoZSBmaWxlc3lzdGVtIGFuZAo+Pj4+IHNo
cmluayB0aGUgaW5vZGUvZGVudHJ5IGNhY2hlcyBpbiBhICJ5b3VyIGRldmljZSB3ZW50IGF3YXki
IGhhbmRsZXIuCj4+Pj4gRmFuY3kgZmlsZXN5c3RlbXMgbGlrZSBiY2FjaGVmcyBhbmQgYnRyZnMg
d291bGQgbGlrZWx5IGp1c3Qgc2hpZnQgSU8gdG8KPj4+PiBhIGRpZmZlcmVudCBiZGV2LCByaWdo
dD8gIEFuZCB0aGVyZSdzIG5vIGdvb2QgcmVhc29uIHRvIHJ1biBzaHJpbmtlcnMgb24KPj4+PiBl
aXRoZXIgb2YgdGhvc2UgZnNlcywgcmlnaHQ/Cj4+Pgo+Pj4gSSBhZ3JlZSBpdCBpcyBhd2t3YXJk
IGFuZCBiY2FjaGVmcyBhdm9pZHMgdGhlc2UgaW4gY2FzZSBvZiByZW1vdmFsIGl0IGNhbgo+Pj4g
aGFuZGxlIGdyYWNlZnVsbHkgQUZBSUNTLgo+Pj4KPj4+Pj4gWWVzLCB0aGUgbmFtaW5nIGlzIG5v
dCBwZXJmZWN0IGFuZCBtaXhpbmcgY2F1c2UgYW5kIGFjdGlvbiwgYnV0IHRoZSBlbmQKPj4+Pj4g
cmVzdWx0IGlzIHN0aWxsIGEgbW9yZSBnZW5lcmljIGFuZCBsZXNzIGR1cGxpY2F0ZWQgY29kZSBi
YXNlLgo+Pj4+Cj4+Pj4gSSB0aGluayBkY2hpbm5lciBtYWtlcyBhIGdvb2QgcG9pbnQgdGhhdCBp
ZiB5b3VyIGZpbGVzeXN0ZW0gY2FuIGRvCj4+Pj4gc29tZXRoaW5nIGNsZXZlciBvbiBkZXZpY2Ug
cmVtb3ZhbCwgaXQgc2hvdWxkIHByb3ZpZGUgaXRzIG93biBibG9jawo+Pj4+IGRldmljZSBob2xk
ZXIgb3BzIGluc3RlYWQgb2YgdXNpbmcgZnNfaG9sZGVyX29wcy4gIEkgZG9uJ3QgdW5kZXJzdGFu
ZAo+Pj4+IHdoeSB5b3UgbmVlZCBhICJnZW5lcmljIiBzb2x1dGlvbiBmb3IgYnRyZnMgd2hlbiBp
dCdzIG5vdCBnb2luZyB0byBkbwo+Pj4+IHdoYXQgdGhlIG90aGVycyBkbyBhbnl3YXkuCj4+Pgo+
Pj4gV2VsbCwgSSdkIGFsc28gc2F5IGp1c3QgZ28gZm9yIG93biBmc19ob2xkZXJfb3BzIGlmIGl0
IHdhcyBub3QgZm9yIHRoZQo+Pj4gYXdrd2FyZCAiZ2V0IHN1cGVyIGZyb20gYmRldiIgc3RlcC4g
QXMgQ2hyaXN0aWFuIHdyb3RlIHdlJ3ZlIGVuY2Fwc3VsYXRlZAo+Pj4gdGhhdCBpbiBmcy9zdXBl
ci5jIGFuZCBiZGV2X3N1cGVyX2xvY2soKSBpbiBwYXJ0aWN1bGFyIGJ1dCB0aGUgY2FsbGluZwo+
Pj4gY29udmVudGlvbnMgZm9yIHRoZSBmc19ob2xkZXJfb3BzIGFyZSBub3QgdmVyeSBuaWNlICho
b2xkaW5nCj4+PiBiZGV2X2hvbGRlcl9sb2NrLCBuZWVkIHRvIHJlbGVhc2UgaXQgYmVmb3JlIGdy
YWJiaW5nIHByYWN0aWNhbGx5IGFueXRoaW5nCj4+PiBlbHNlKSBzbyBJJ2QgaGF2ZSBtdWNoIGdy
ZWF0ZXIgcGVhY2Ugb2YgbWluZCBpZiB0aGlzIGRpZG4ndCBzcHJlYWQgdG9vCj4+PiBtdWNoLiBP
bmNlIHlvdSBjYWxsIGJkZXZfc3VwZXJfbG9jaygpIGFuZCBob2xkIG9uIHRvIHNiIHdpdGggc191
bW91bnQgaGVsZCwKPj4+IHRoaW5ncyBhcmUgbXVjaCBtb3JlIGNvbnZlbnRpb25hbCBmb3IgdGhl
IGZzIGxhbmQgc28gSSdkIGxpa2UgaWYgdGhpcwo+Pj4gc3RlcCBoYXBwZW5lZCBiZWZvcmUgYW55
IGZzIGhvb2sgZ290IGNhbGxlZC4gU28gSSBwcmVmZXIgc29tZXRoaW5nIGxpa2UKPj4+IFF1J3Mg
cHJvcG9zYWwgb2Ygc2VwYXJhdGUgc2Igb3AgZm9yIGRldmljZSByZW1vdmFsIG92ZXIgZXhwb3J0
aW5nCj4+PiBiZGV2X3N1cGVyX2xvY2soKS4gTGlrZToKPj4+Cj4+PiBzdGF0aWMgdm9pZCBmc19i
ZGV2X21hcmtfZGVhZChzdHJ1Y3QgYmxvY2tfZGV2aWNlICpiZGV2LCBib29sIHN1cnByaXNlKQo+
Pj4gewo+Pj4gICAgICAgICAgc3RydWN0IHN1cGVyX2Jsb2NrICpzYjsKPj4+Cj4+PiAgICAgICAg
ICBzYiA9IGJkZXZfc3VwZXJfbG9jayhiZGV2LCBmYWxzZSk7Cj4+PiAgICAgICAgICBpZiAoIXNi
KQo+Pj4gICAgICAgICAgICAgICAgICByZXR1cm47Cj4+Pgo+Pj4gCWlmIChzYi0+c19vcC0+cmVt
b3ZlX2JkZXYpIHsKPj4+IAkJc2ItPnNfb3AtPnJlbW92ZV9iZGV2KHNiLCBiZGV2LCBzdXJwcmlz
ZSk7Cj4+PiAJCXJldHVybjsKPj4+IAl9Cj4+Cj4+IEl0IGZlZWxzIG9kZCBidXQgSSBjb3VsZCBs
aXZlIHdpdGggdGhpcywgcGFydGljdWxhcmx5IHNpbmNlIHRoYXQncyB0aGUKPj4gZGlyZWN0aW9u
IHRoYXQgYnJhdW5lciBpcyBsYXlpbmcgZG93bi4gOikKPiAKPiBJIHdhbnQgdG8gcmVpdGVyYXRl
IHRoYXQgbm8gb25lIGlzIHNheWluZyAidW5kZXIgbm8gY2lyY3Vtc3RhbmNlcwo+IGltcGxlbWVu
dCB5b3VyIG93biBob2xkZXIgb3BzIi4gQnV0IGlmIHlvdSByZWx5IG9uIHRoZSBWRlMgbG9ja2lu
ZyB0aGVuCj4geW91IGJldHRlciBub3Qgc3BpbGwgaXQncyBndXRzIGludG8geW91ciBmaWxlc3lz
dGVtIGFuZCBtYWtlIHVzIGV4cG9ydAo+IHRoaXMgYmxvb2R5IGxvY2tpbmcgdGhhdCBoYWxmIHRo
ZSB3b3JsZCBoYWQgaW1wbGVtZW50ZWQgd3JvbmcgaW4gdGhlaXIKPiBkcml2ZXJzIGluIHRoZSBm
aXJzdCBwbGFjZXMgc3Bld2luZyBlbmRsZXNzIHN5emJvdCBkZWFkbG9ja3MgcmVwb3J0cwo+IHRo
YXQgd2UgaGFkIHRvIHRyYWNrIGRvd24gYW5kIGZpeC4gVGhhdCB3aWxsIG5vdCBoYXBwZW4gYWdh
aW4gc2ltaWxhcgo+IHdheSB3ZSBkb24ndCBibGVlZCBhbGwgdGhlIG5hc3RpbmVzcyBvZiBvdGhl
ciBsb2NraW5nIHBhdGhzLgo+IAo+IFBsZWFzZSBhbGwgc3RvcCBsb25nIHBoaWxvc29waGljYWwg
dHJlYXRpc2VzIGFib3V0IHRoaW5ncyBubyBvbiBoYXMgZXZlcgo+IGFyZ3VlZC4gYnRyZnMgd2Fu
dHMgdG8gcmVseSBvbiB0aGUgVkZTIGluZnJhLiBUaGF0IGlzIGZpbmUgYW5kIHdlbGwuIFdlCj4g
d2lsbCBzdXBwb3J0IGFuZCBlbmFibGUgdGhpcy4KPiAKPiBJIHRoaW5rIHRoZSB0d28gbWV0aG9k
IGlkZWEgaXMgZmluZSBnaXZlbiB0aGF0IHRoZXkgbm93IGFyZSBjbGVhcmx5Cj4gZGVsaW5lYXRl
ZC4KPiAKPiBUaGFua3MgZm9yIHByb3ZpZGluZyBzb21lIGNsYXJpdHkgaGVyZSwgRGFycmljayBh
bmQgUXUuCj4gCgpTbyB0aGUgbmV4dCB1cGRhdGUgd291bGQgYmUgc29tZXRoaW5nIGxpa2UgdGhp
cyBmb3IgZnNfYmRldl9tYXJrX2RlYWQoKToKCglzYiA9IGJkZXZfc3VwZXJfbG9jaygpOwoJaWYg
KCFzYikKCQlyZXR1cm47CglpZiAoIXN1cnByaXNlKQoJCXN5bmNfZmlsZXN5c3RlbShzYik7CisJ
aWYgKHNiLT5zX29wLT5yZW1vdmVfYmRldikgeworCQlyZXQgPSBzYi0+c19vcC0+cmVtb3ZlX2Jk
ZXYoKTsKKwkJaWYgKCFyZXQpIHsKKwkJCS8qIEZzIGNhbiBoYW5kbGUgdGhlIGRldiBsb3NzLiAq
LworCQkJc3VwZXJfdW5sb2NrX3NoYXJlZCgpOworCQkJcmV0dXJuOworCQl9CisJfQorCS8qIEZz
IGNhbiBub3QgaGFuZGxlIHRoZSBkZXYgbG9zcywgc2h1dGRvd24uICovCglzaHJpbmtfZGNhY2hl
X3NiKCk7CglldmljdF9pbm9kZXMoKTsKCWlmIChzYi0+c19vcC0+c2h1dGRvd24pCgkJc2ItPnNf
b3AtPnNodXRkb3duKCk7CglzdXBlcl91bmxvY2tfc2hhcmVkKCk7CgpUaGlzIG1lYW5zIC0+cmVt
b3ZlX2JkZXYoKSBtdXN0IGhhdmUgYSByZXR1cm4gdmFsdWUgdG8gaW5kaWNhdGUgaWYgdGhlIApm
cyBjYW4gaGFuZGxlIHRoZSBsb3NzLgpBbmQgYW55IGVycm9yLCBubyBtYXR0ZXIgaWYgaXQncyBu
b3QgZW5vdWdoIHRvbGVyYW5jZSBmcm9tIHRoZSBmcyBvciAKc29tZSBvdGhlciBwcm9ibGVtIGR1
cmluZyB0aGUgZGV2IGxvc3MgaGFuZGxpbmcsIHRoZSBvbGQgc2h1dGRvd24gCmJlaGF2aW9yIHdp
bGwgYmUgdHJpZ2dlcmVkLgoKV291bGQgdGhpcyBiZSBhbiBhY2NlcHRhYmxlIHNvbHV0aW9uPwoK
VGhhbmtzLApRdQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK
