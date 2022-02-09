Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7FD4AE646
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Feb 2022 02:10:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nHbV0-0003uK-Uv; Wed, 09 Feb 2022 01:10:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nHbUz-0003uE-BW
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Feb 2022 01:10:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W6TSsRpygqlqoULYrapH5xvXCa7cKDyPmu3Lz6vpUvI=; b=BySbQqZ/v3EH+/P+sk1qqdAw1c
 OD2RjJsJiqiQb90oghu8SR3MsWW5lINY/EVMp5AKqkxsyYeWCQkJd3lpx9AnrRhbwEGr3J0d911J3
 X/i6nWz7PVVcjFqZ8r+V2iDFxqQ/9EBupX1UQPQ3nZQyJFiHwwazC1h/zx6RYz/S8J8w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W6TSsRpygqlqoULYrapH5xvXCa7cKDyPmu3Lz6vpUvI=; b=ZM5ariMz9D4ixpDBlHq+5DtRxw
 OwM1sCndzag9Wyor6DLPFocJdTLbHM0ETsuLAgvoj687MjacHeuAVIYFkjYmNPSKfsxS3Llz3jIaZ
 jZoFwcsGMO3ZMUbJEAQrL7iEQ0qvcAD54McuphSSpi/d8DnuAjAiATHqkWHgyFHyiEdo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nHbUx-00AmyA-Bi
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Feb 2022 01:10:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F332161859;
 Wed,  9 Feb 2022 01:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1738FC004E1;
 Wed,  9 Feb 2022 01:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644369005;
 bh=G5uU/wOKKaUc/jSB9K/5/TwossD5zIXWmIxvGuOzgDE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g64r5u3/yYniiCa/eGal3suK3t2qCPO5J8yjTr+WXAz7eV8KGckCF1qJnGp4mlxhX
 crxCbvMqVjF5t9z3Kuu1yHICd1AwKVPz3WqXQnJYZ0PF+coVPc/INbvPtR92OX3HcR
 dBCA8/tfnlboHQALxTmSwSdkdK+N8WfRFJWOuNK5Nm6AgMGyFPkClxPMB/1pE7ZC4C
 5PKfXBrFi/q2I57lmvcg+8rUmLtSyDlaEf77EXpbYqh+gGIXMnDUHQ7qAwldeiiq88
 +CJL66sz2DcUB4BxmkrZ2zXSjF4uhel4U7JdVSe6+TycxOaMGjw/YzGUBLNnxgJY0o
 R3TY12fL2xvBA==
Date: Tue, 8 Feb 2022 17:10:03 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <YgMUa2Cdr/QoMTPh@sol.localdomain>
References: <20220120071215.123274-1-ebiggers@kernel.org>
 <YekdnxpeunTGfXqX@infradead.org> <20220120171027.GL13540@magnolia>
 <YenIcshA706d/ziV@sol.localdomain>
 <20220120210027.GQ13540@magnolia>
 <20220120220414.GH59729@dread.disaster.area>
 <Yenm1Ipx87JAlyXg@sol.localdomain>
 <20220120235755.GI59729@dread.disaster.area>
 <20220121023603.GH13563@magnolia>
 <20220123230332.GL59729@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220123230332.GL59729@dread.disaster.area>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 24, 2022 at 10:03:32AM +1100, Dave Chinner wrote:
 > > > > /* 0xa0 */ > > > > /* File range alignment needed for best performance,
 in bytes. */ > > __u32 stx_dio_fpos_align_opt; > > This is [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nHbUx-00AmyA-Bi
Subject: Re: [f2fs-dev] [PATCH v10 0/5] add support for direct I/O with
 fscrypt using blk-crypto
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
Cc: linux-xfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 "Darrick J. Wong" <djwong@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBKYW4gMjQsIDIwMjIgYXQgMTA6MDM6MzJBTSArMTEwMCwgRGF2ZSBDaGlubmVyIHdy
b3RlOgo+ID4gCj4gPiAJLyogMHhhMCAqLwo+ID4gCj4gPiAJLyogRmlsZSByYW5nZSBhbGlnbm1l
bnQgbmVlZGVkIGZvciBiZXN0IHBlcmZvcm1hbmNlLCBpbiBieXRlcy4gKi8KPiA+IAlfX3UzMglz
dHhfZGlvX2Zwb3NfYWxpZ25fb3B0Owo+IAo+IFRoaXMgaXMgYSBjb21tb24gcHJvcGVydHkgb2Yg
Ym90aCBESU8gYW5kIGJ1ZmZlcmVkIElPLCBzbyBubyBuZWVkCj4gZm9yIGl0IHRvIGJlIGRpby1v
bmx5IHByb3BlcnR5Lgo+IAo+IAlfX3UzMglzdHhfb2Zmc2V0X2FsaWduX29wdGltYWw7Cj4gCgpM
b29raW5nIGF0IHRoaXMgbW9yZSBjbG9zZWx5OiB3aWxsIHN0eF9vZmZzZXRfYWxpZ25fb3B0aW1h
bCBhY3R1YWxseSBiZSB1c2VmdWwsCmdpdmVuIHRoYXQgc3RbeF1fYmxrc2l6ZSBhbHJlYWR5IGV4
aXN0cz8KCkZyb20gdGhlIHN0YXQoMikgYW5kIHN0YXR4KDIpIG1hbiBwYWdlczoKCglzdF9ibGtz
aXplCgkJVGhpcyBmaWVsZCAgZ2l2ZXMgIHRoZSAgInByZWZlcnJlZCIgIGJsb2NrICBzaXplICBm
b3IgIGVmZmljaWVudAoJCWZpbGVzeXN0ZW0gSS9PLgoKCXN0eF9ibGtzaXplCgkJVGhlICJwcmVm
ZXJyZWQiIGJsb2NrIHNpemUgZm9yIGVmZmljaWVudCBmaWxlc3lzdGVtIEkvTy4gIChXcml04oCQ
CgkJaW5nICB0byAgYSBmaWxlIGluIHNtYWxsZXIgY2h1bmtzIG1heSBjYXVzZSBhbiBpbmVmZmlj
aWVudCByZWFkLQoJCW1vZGlmeS1yZXdyaXRlLikKCkZpbGUgb2Zmc2V0cyBhcmVuJ3QgZXhwbGlj
aXRseSBtZW50aW9uZWQsIGJ1dCBJIHRoaW5rIGl0J3MgaW1wbGllZCB0aGV5IHNob3VsZApiZSBh
IG11bHRpcGxlIG9mIHN0W3hdX2Jsa3NpemUsIGp1c3QgbGlrZSB0aGUgSS9PIHNpemUuICBPdGhl
cndpc2UsIHRoZSBJL08Kd291bGQgb2J2aW91c2x5IHJlcXVpcmUgcmVhZGluZy93cml0aW5nIHBh
cnRpYWwgYmxvY2tzLgoKU28sIHRoZSBwcm9wb3NlZCBzdHhfb2Zmc2V0X2FsaWduX29wdGltYWwg
ZmllbGQgc291bmRzIGxpa2UgdGhlIHNhbWUgdGhpbmcgdG8KbWUuICBJcyB0aGVyZSBhbnl0aGlu
ZyBJJ20gbWlzdW5kZXJzdGFuZGluZz8KClB1dHRpbmcgc3R4X29mZnNldF9hbGlnbl9vcHRpbWFs
IGJlaGluZCB0aGUgU1RBVFhfRElSRUNUSU8gZmxhZyB3b3VsZCBhbHNvIGJlCmNvbmZ1c2luZyBp
ZiBpdCB3b3VsZCBhcHBseSB0byBib3RoIGRpcmVjdCBhbmQgYnVmZmVyZWQgSS9PLgoKLSBFcmlj
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo=
