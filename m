Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D8BAD5B18
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Jun 2025 17:52:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pi74T3e8ibpp5TQ86r4tTFp74NUWRfirQYdIagrqDSQ=; b=V8i5WrQloP+hCZ2f8iV986MYnv
	HUXOOdyrLPXG0WS0v4+Oi/VPRZ0CMwsIPD/NNsmXT7T6ptH2EksWfaf+AV2Vf9gvWOumXo0Skzfeu
	NWiBH2GlfCGet4Zbs2R+7rhKXm9pfdUokxmYyxovMXn2R2pnapiaB7VAKyW3ojSdRdl4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPNkK-0005ly-6d;
	Wed, 11 Jun 2025 15:52:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1uPNk4-0005lV-LY
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jun 2025 15:51:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R8+lkTfzokc88TdUJ8NpqEICvfoajt7yboALcBqiw/Y=; b=HlTMc7MHdlactZbSOxQRzH9TJy
 rnR/totsTV1VnT/avWOhtgxRcNRZmE+0m14QQpsmHxme+aYRcecZVeQ4PXYG3j+jrs85GmVpVDmt6
 kk2+91D0cXV1i6xQPPHmEZ0/HyRQ7bNtsHvEL+anuW9Yp10kl/qyy1fsVoWBliFK5Czg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R8+lkTfzokc88TdUJ8NpqEICvfoajt7yboALcBqiw/Y=; b=X6Ua8u80kUY9nSm8FyG/kQGd3L
 mpOntZLYCgzxACrwE1eVWYDyqIgfJ8A+sxtAz2sbvQ43xI8UTQDOi/LOit2xIqS6wyXjyWVNTIAwB
 r3TwhK8SRx9hv2/j/txcixZRULkFUhZLzkFBIRE2zW1II8lvs5vvg+lv9mYguCPtFw1s=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uPNk4-0006kM-6D for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jun 2025 15:51:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 81671A518F6;
 Wed, 11 Jun 2025 15:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CC8CC4CEE3;
 Wed, 11 Jun 2025 15:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749657105;
 bh=Skl9KDuzJqFaqd+d7kcHfX6PNCmoq83oIlnZ4Q2zi04=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iwkK3sVut+NThYh8qunzKpQ31Iwkrb1zjgxChbVqqV+oYpwR7fQbZPVg5A4Edk1ro
 DCx3vF9ZtNT6ZDuYi3UopU5ifN5EotQF9zpy+5l37R7AVrIL3EIjhVePvIh9dIB4ZS
 G/6R65R4Dn9ayyjY0KN/zRtZ28f2pepHw4nRUylMoAEErlDyz33KfDqQ4RyC751rg1
 +FDXedv6UJgjDRzfI7isBuziAum8IKVKFsQzx3ZXq/U/fnwpekElwBhfmXNCNgWWCD
 fqUIl1THgMSG4gfel9y+JyZmo6pLuQ80/jT72VVbjkgut1TcwbA6dDPc6rIL2IitzD
 9a5tjk1UXZF3w==
Date: Wed, 11 Jun 2025 08:51:44 -0700
To: Kundan Kumar <kundanthebest@gmail.com>
Message-ID: <20250611155144.GD6138@frogsfrogsfrogs>
References: <CGME20250529113215epcas5p2edd67e7b129621f386be005fdba53378@epcas5p2.samsung.com>
 <20250529111504.89912-1-kundan.kumar@samsung.com>
 <20250602141904.GA21996@lst.de>
 <c029d791-20ca-4f2e-926d-91856ba9d515@samsung.com>
 <20250603132434.GA10865@lst.de>
 <CACzX3AuBVsdEUy09W+L+xRAGLsUD0S9+J2AO8nSguA2nX5d8GQ@mail.gmail.com>
 <CALYkqXqVRYqq+5_5W4Sdeh07M8DyEYLvrsm3yqhhCQTY0pvU1g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALYkqXqVRYqq+5_5W4Sdeh07M8DyEYLvrsm3yqhhCQTY0pvU1g@mail.gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jun 04, 2025 at 02:52:34PM +0530, Kundan Kumar wrote:
 > > > > For xfs used this command: > > > > xfs_io -c "stat" /mnt/testfile
 > > > > And for ext4 used this: > > > > filefrag /mnt/testfile > [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uPNk4-0006kM-6D
Subject: Re: [f2fs-dev] [PATCH 00/13] Parallelizing filesystem writeback
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: ritesh.list@gmail.com, Anuj gupta <anuj1072538@gmail.com>, jack@suse.cz,
 amir73il@gmail.com, david@fromorbit.com, gfs2@lists.linux.dev,
 linux-mm@kvack.org, clm@meta.com, Christoph Hellwig <hch@lst.de>,
 dave@stgolabs.net, agruenba@redhat.com, miklos@szeredi.hu,
 Kundan Kumar <kundan.kumar@samsung.com>, willy@infradead.org,
 p.raghav@samsung.com, Anuj Gupta/Anuj Gupta <anuj20.g@samsung.com>,
 linux-nfs@vger.kernel.org, da.gomez@samsung.com, viro@zeniv.linux.org.uk,
 jaegeuk@kernel.org, axboe@kernel.dk, brauner@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, mcgrof@kernel.org, anna@kernel.org,
 gost.dev@samsung.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 trondmy@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBKdW4gMDQsIDIwMjUgYXQgMDI6NTI6MzRQTSArMDUzMCwgS3VuZGFuIEt1bWFyIHdy
b3RlOgo+ID4gPiA+IEZvciB4ZnMgdXNlZCB0aGlzIGNvbW1hbmQ6Cj4gPiA+ID4geGZzX2lvIC1j
ICJzdGF0IiAvbW50L3Rlc3RmaWxlCj4gPiA+ID4gQW5kIGZvciBleHQ0IHVzZWQgdGhpczoKPiA+
ID4gPiBmaWxlZnJhZyAvbW50L3Rlc3RmaWxlCj4gPiA+Cj4gPiA+IGZpbGVmcmFnIG1lcmdlcyBj
b250aWd1b3VzIGV4dGVudHMsIGFuZCBvbmx5IGNvdW50cyB1cCBmb3IgZGlzY29udGlndW91cwo+
ID4gPiBtYXBwaW5ncywgd2hpbGUgZnN4YXR0ci5uZXh0ZW50cyBjb3VudHMgYWxsIGV4dGVudCBl
dmVuIGlmIHRoZXkgYXJlCj4gPiA+IGNvbnRpZ3VvdXMuICBTbyB5b3UgcHJvYmFibHkgd2FudCB0
byB1c2UgZmlsZWZyYWcgZm9yIGJvdGggY2FzZXMuCj4gPgo+ID4gR290IGl0IOKAlCB0aGFua3Mg
Zm9yIHRoZSBjbGFyaWZpY2F0aW9uLiBXZSdsbCBzd2l0Y2ggdG8gdXNpbmcgZmlsZWZyYWcKPiA+
IGFuZCB3aWxsIHNoYXJlIHVwZGF0ZWQgZXh0ZW50IGNvdW50IG51bWJlcnMgYWNjb3JkaW5nbHku
Cj4gCj4gVXNpbmcgZmlsZWZyYWcsIHdlIHJlY29yZGVkIGV4dGVudCBjb3VudHMgb24geGZzIGFu
ZCBleHQ0IGF0IHRocmVlCj4gc3RhZ2VzOgo+IGEuIEp1c3QgYWZ0ZXIgYSAxRyByYW5kb20gd3Jp
dGUsCj4gYi4gQWZ0ZXIgYSAzMC1zZWNvbmQgd2FpdCwKPiBjLiBBZnRlciB1bm1vdW50aW5nIGFu
ZCByZW1vdW50aW5nIHRoZSBmaWxlc3lzdGVtLAo+IAo+IHhmcwo+IEJhc2UKPiBhLiA2MjUxICAg
Yi4gMjUyNiAgYy4gMjUyNgo+IFBhcmFsbGVsIHdyaXRlYmFjawo+IGEuIDYxODMgICBiLiAyMzI2
ICBjLiAyMzI2CgpJbnRlcmVzdGluZyB0aGF0IHRoZSBtYXBwaW5nIHJlY29yZCBjb3VudCBnb2Vz
IGRvd24uLi4KCkkgd29uZGVyLCB5b3Ugc2FpZCB0aGUgeGZzIGZpbGVzeXN0ZW0gaGFzIDQgQUdz
IGFuZCAxMiBjb3Jlcywgc28gSSBndWVzcwp3Yl9jdHhfYXJyW10gaXMgMTI/ICBJIHdvbmRlciwg
ZG8geW91IHNlZSBhIGtuZWUgcG9pbnQgaW4gd3JpdGViYWNrCnRocm91Z2hwdXQgd2hlbiB0aGUg
IyBvZiB3YiBjb250ZXh0cyBleGNlZWRzIHRoZSBBRyBjb3VudD8KClRob3VnaCBJIGd1ZXNzIGZv
ciB0aGUgKGhvcGVmdWxseSBjb21tb24pIGNhc2Ugb2YgcHVyZSBvdmVyd3JpdGVzLCB3ZQpkb24n
dCBoYXZlIHRvIGRvIGFueSBtZXRhZGF0YSB1cGRhdGVzIHNvIHdlIHdvdWxkbid0IHJlYWxseSBo
aXQgYQpzY2FsaW5nIGxpbWl0IGR1ZSB0byBhZyBjb3VudCBvciBsb2cgY29udGVudGlvbiBvciB3
aGF0ZXZlci4gIERvZXMgdGhhdApzcXVhcmUgd2l0aCB3aGF0IHlvdSBzZWU/Cgo+IGV4dDQKPiBC
YXNlCj4gYS4gNzA4MCAgIGIuIDcwODAgICAgYy4gMTEKPiBQYXJhbGxlbCB3cml0ZWJhY2sKPiBh
LiA1OTYxICAgYi4gNTk2MSAgICBjLiAxMQoKSHVtLCB0aGF0J3MgcGFydGljdWxhcmx5IC4uLiBp
bnRlcmVzdGluZy4gIEkgd29uZGVyIHdoYXQgdGhlIG1hcHBpbmcKY291bnQgYmVoYXZpb3JzIGFy
ZSB3aGVuIHlvdSB0dXJuIG9mZiBkZWxheWVkIGFsbG9jYXRpb24/CgotLUQKCj4gVXNlZCB0aGUg
c2FtZSBmaW8gY29tbWFuZGxpbmUgYXMgZWFybGllcjoKPiBmaW8gLS1maWxlbmFtZT0vbW50L3Rl
c3RmaWxlIC0tbmFtZT10ZXN0IC0tYnM9NGsgLS1pb2RlcHRoPTEwMjQKPiAtLXJ3PXJhbmR3cml0
ZSAtLWlvZW5naW5lPWlvX3VyaW5nICAtLWZhbGxvY2F0ZT1ub25lIC0tbnVtam9icz0xCj4gLS1z
aXplPTFHIC0tZGlyZWN0PTAgLS1ldGEtaW50ZXJ2YWw9MSAtLWV0YS1uZXdsaW5lPTEKPiAtLWdy
b3VwX3JlcG9ydGluZwo+IAo+IGZpbGVmcmFnIGNvbW1hbmQ6Cj4gZmlsZWZyYWcgIC9tbnQvdGVz
dGZpbGUKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCg==
