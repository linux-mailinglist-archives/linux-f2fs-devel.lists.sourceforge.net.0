Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2827BDC4D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Oct 2023 14:37:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qppVy-0002ft-UE;
	Mon, 09 Oct 2023 12:37:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1qppVx-0002fn-Mx
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Oct 2023 12:37:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3EI76alpSLlxszEmBQEhBDYL/K97Jp4t/dxHfRyk5Es=; b=hCsca8TbWj1KfdEDqFOR5Iyba4
 HfsJhr3atb8rtXRWRfJ3p+xZ7E/2FfthgVI9zCzyf7tuO5mEt3t6Fr+5kA+lLCLOsW6LEArwqTXej
 HsGj5q9e7iQ4HQKWfAYcfruKpQDiMVeAs92QoTGNiOnlqy06RjYml5A/INt8P9DBFJLU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3EI76alpSLlxszEmBQEhBDYL/K97Jp4t/dxHfRyk5Es=; b=W6xCaIdOv/QQ2C+iA4zc4W69bY
 4UygepqAqcntFeb3XGimSpfAupp9fgHIXEK8RxX2zUwmYAiQ7J2MktTKI29Fh9m2Kvb8nz6U51DH5
 6KR9rysaZ99TU4iakkjiFkcOVmLxhWmzQoq2gdmiiX8mOSz6kBBTsaBaChEUUhszF7G8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qppVu-008PO5-Fl for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Oct 2023 12:37:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id BD39FB81141;
 Mon,  9 Oct 2023 12:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5626C433C8;
 Mon,  9 Oct 2023 12:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696855047;
 bh=a5bE6yi0Y8uBlf8hd66K9CjHe4sGRHljieVfPGaGVY4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gLoe32ZISCJRKawT1uuNATHYyBY0BEf/Y2lK6hZUCa4JrCY8F+ywn0LdfpdNKceIG
 I4vcIrrrb3tkUN+F5sEjgNQitgaCcWmLuYydcIM/biY9rnIfiyRSxm20OTJbPoH/rr
 tX7p005mKCi5AEnxIBKmqITGWk1YFjGPD6qP8w32K4+cmVOl6HcWEyQKUsKXTz8HRj
 V87KuBuW5ejNn4FYa1fAbJV/RdVFtYLAdfRn34QBWSi9wwZMBRw4aRo2rCoWYxv4To
 yIfnPC2k7v5wurg0LAwN//88Ndv2JseTrt1kt91pJRJC3e8xRsnw4VXRAnvUHw6Zq+
 Pb7l3XYbqCK2A==
Date: Mon, 9 Oct 2023 14:37:15 +0200
From: Christian Brauner <brauner@kernel.org>
To: syzbot <syzbot+062317ea1d0a6d5e29e7@syzkaller.appspotmail.com>
Message-ID: <20231009-leihgabe-abseilen-26e86d03f787@brauner>
References: <0000000000001825ce06047bf2a6@google.com>
 <00000000000071133306073f06ca@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00000000000071133306073f06ca@google.com>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Sun, Oct 08, 2023 at 07:05:32PM -0700, syzbot wrote: >
   syzbot has bisected this issue to: > > commit 7908632f2927b65f7486ae6b67c24071666ba43f
    > Author: Maíra Canal <mcanal@igalia.com> > Date: Thu [...] 
 
 Content analysis details:   (-0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  2.5 SORTED_RECIPS          Recipient list is sorted by address
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qppVu-008PO5-Fl
Subject: Re: [f2fs-dev] [syzbot] [reiserfs?] possible deadlock in super_lock
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
Cc: axboe@kernel.dk, hdanton@sina.com, mcanal@igalia.com, jack@suse.cz,
 reiserfs-devel@vger.kernel.org, daniel.vetter@ffwll.ch,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 willy@infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 mairacanal@riseup.net, terrelln@fb.com, yukuai3@huawei.com,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, jinpu.wang@ionos.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gU3VuLCBPY3QgMDgsIDIwMjMgYXQgMDc6MDU6MzJQTSAtMDcwMCwgc3l6Ym90IHdyb3RlOgo+
IHN5emJvdCBoYXMgYmlzZWN0ZWQgdGhpcyBpc3N1ZSB0bzoKPiAKPiBjb21taXQgNzkwODYzMmYy
OTI3YjY1Zjc0ODZhZTZiNjdjMjQwNzE2NjZiYTQzZgo+IEF1dGhvcjogTWHDrXJhIENhbmFsIDxt
Y2FuYWxAaWdhbGlhLmNvbT4KPiBEYXRlOiAgIFRodSBTZXAgMTQgMTA6MTk6MDIgMjAyMyArMDAw
MAo+IAo+ICAgICBSZXZlcnQgImRybS92a21zOiBGaXggcmFjZS1jb25kaXRpb24gYmV0d2VlbiB0
aGUgaHJ0aW1lciBhbmQgdGhlIGF0b21pYyBjb21taXQiCj4gCj4gYmlzZWN0aW9uIGxvZzogIGh0
dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvYmlzZWN0LnR4dD94PTE3ZmMwNTY1NjgwMDAw
Cj4gc3RhcnQgY29tbWl0OiAgIDJjZjBmNzE1NjIzOCBNZXJnZSB0YWcgJ25mcy1mb3ItNi42LTIn
IG9mIGdpdDovL2dpdC5saW51eC0uLgo+IGdpdCB0cmVlOiAgICAgICB1cHN0cmVhbQo+IGZpbmFs
IG9vcHM6ICAgICBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94L3JlcG9ydC50eHQ/eD0x
NDAyMDU2NTY4MDAwMAo+IGNvbnNvbGUgb3V0cHV0OiBodHRwczovL3N5emthbGxlci5hcHBzcG90
LmNvbS94L2xvZy50eHQ/eD0xMDAyMDU2NTY4MDAwMAo+IGtlcm5lbCBjb25maWc6ICBodHRwczov
L3N5emthbGxlci5hcHBzcG90LmNvbS94Ly5jb25maWc/eD03MTBkYzQ5YmVjZTQ5NGRmCj4gZGFz
aGJvYXJkIGxpbms6IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL2J1Zz9leHRpZD0wNjIz
MTdlYTFkMGE2ZDVlMjllNwo+IHN5eiByZXBybzogICAgICBodHRwczovL3N5emthbGxlci5hcHBz
cG90LmNvbS94L3JlcHJvLnN5ej94PTEwN2U5NTE4NjgwMDAwCj4gCj4gUmVwb3J0ZWQtYnk6IHN5
emJvdCswNjIzMTdlYTFkMGE2ZDVlMjllN0BzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tCj4gRml4
ZXM6IDc5MDg2MzJmMjkyNyAoIlJldmVydCAiZHJtL3ZrbXM6IEZpeCByYWNlLWNvbmRpdGlvbiBi
ZXR3ZWVuIHRoZSBocnRpbWVyIGFuZCB0aGUgYXRvbWljIGNvbW1pdCIiKQo+IAo+IEZvciBpbmZv
cm1hdGlvbiBhYm91dCBiaXNlY3Rpb24gcHJvY2VzcyBzZWU6IGh0dHBzOi8vZ29vLmdsL3Rwc21F
SiNiaXNlY3Rpb24KClRoZSBiaXNlY3QgaXMgb2J2aW91c2x5IGJvZ3VzLiBJIGhhdmVuJ3Qgc2Vl
bmQgdGhhdCBidWcgcmVwb3J0IGJlZm9yZQpvdGhlcndpc2UgSSB3b3VsZCd2ZSBhbHJlYWR5IGZp
eGVkIHRoaXMgd2F5IGVhcmxpZXI6Cgojc3l6IHRlc3Q6IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Zmcy92ZnMuZ2l0IGI0L3Zmcy1maXhlcy1yZWlzZXJm
cwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4
LWYyZnMtZGV2ZWwK
