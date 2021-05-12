Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C13A637C2FA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 May 2021 17:18:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgqch-0003Oi-4q; Wed, 12 May 2021 15:18:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1lgqcf-0003OD-3q; Wed, 12 May 2021 15:18:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2xN+R39aaeOZ1c9zQ3zvMUpB70ZLuvOfU+/UcsP16Rk=; b=cqVE6ixaSWRrF1RlkF/y08S46z
 eFu5ZZpA12QouaftkOWZHjvXYDkmpJIukD5CiBR1F7lbbGQ4k4KJalcpB0d1GIdQwIoCEakfSlU9z
 dpbTKzLCTo9oZoN6O0ouIkz6ISYzOZmB/DnP3WBlTcj152t+tvPXhN30c74lWK1m3LvA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2xN+R39aaeOZ1c9zQ3zvMUpB70ZLuvOfU+/UcsP16Rk=; b=nNowtB564hxDqA+bsPpvr2sttY
 3rVmNtorznZhM2rXI2VndFeLZxrq/2H3onuvygNd75AfX3UNvS6dBPjSClXi9UagHbGVyranQ6CEc
 wA9Q0mt0FGBEZvBQuLCUOECctex51IvZVrNGtc7boO2evIJe4kewm8B8NmHAGldSebEU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lgqcc-0000Jp-Da; Wed, 12 May 2021 15:18:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 455F961C3E;
 Wed, 12 May 2021 15:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620832672;
 bh=zB2G4t5ozyJ72g68BGRplKf2lQRTS6CtRvJ7FVX3NWE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DBjrvZcbfODq6o/u3ovhcKp34o3mQ/2g2kqOKbw7rqi0UbJcuDmNkgLMMy0M05dFs
 mwfV7fdqIvkaHvs5FkFIxP3pQ5mW2wuelKsM0Zg1XI928MZ1g6hDtwlC/lZ6mTYtDn
 L0yXyxJPdKzjgMXD6Vs/vdQOXuvQV+DBBKSwRDhM/LlZ9x9/DV6Qnq7MjBym4Ue3He
 LklNFflnfSaW1SCikrvqRJriPDliUiNhIaGm2pb/3nXItDzT/4/obeOPpO0NPN/v0m
 Pwish5sD0axq4vDEIuCSUJZyKrnPcy3P6Nd30IKN+fHXybC5E+QSyK+xdLgaNeWw/l
 +EUyGcBOd8VUw==
Date: Wed, 12 May 2021 17:17:41 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Theodore Ts'o" <tytso@mit.edu>
Message-ID: <20210512171741.2870bcbc@coco.lan>
In-Reply-To: <YJvi1L2ss5Tfi+My@mit.edu>
References: <cover.1620823573.git.mchehab+huawei@kernel.org>
 <YJvi1L2ss5Tfi+My@mit.edu>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lgqcc-0000Jp-Da
Subject: Re: [f2fs-dev] [PATCH v2 00/40] Use ASCII subset instead of UTF-8
 alternate symbols
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
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 keyrings@vger.kernel.org, linux-sgx@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 linux-acpi@vger.kernel.org, Mali DP Maintainers <malidp@foss.arm.com>,
 linux-input@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-ext4@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 coresight@lists.linaro.org, rcu@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RW0gV2VkLCAxMiBNYXkgMjAyMSAxMDoxNDo0NCAtMDQwMAoiVGhlb2RvcmUgVHMnbyIgPHR5dHNv
QG1pdC5lZHU+IGVzY3JldmV1OgoKPiBPbiBXZWQsIE1heSAxMiwgMjAyMSBhdCAwMjo1MDowNFBN
ICswMjAwLCBNYXVybyBDYXJ2YWxobyBDaGVoYWIgd3JvdGU6Cj4gPiB2MjoKPiA+IC0gcmVtb3Zl
ZCBFTS9FTiBEQVNIIGNvbnZlcnNpb24gZnJvbSB0aGlzIHBhdGNoc2V0OyAgCj4gCj4gQXJlIHlv
dSBzdGlsbCB0aGlua2luZyBhYm91dCBkb2luZyB0aGUKPiAKPiBFTiBEQVNIIC0tPiAiLS0iCj4g
RU0gREFTSCAtLT4gIi0tLSIKPiAKPiBjb252ZXJzaW9uPyAgCgpZZXMsIGJ1dCBJIGludGVuZCB0
byBzdWJtaXQgaXQgb24gYSBzZXBhcmF0ZSBwYXRjaCBzZXJpZXMsIHByb2JhYmx5IGFmdGVyCmhh
dmluZyB0aGlzIG9uZSBtZXJnZWQuIExldCdzIGZpcnN0IGNsZWFudXAgdGhlIGxhcmdlIHBhcnQg
b2YgdGhlIApjb252ZXJzaW9uLWdlbmVyYXRlZCBVVEYtOCBjaGFyIG5vaXNlIDstKQoKPiBUaGF0
J3Mgbm90IGdvaW5nIHRvIGNoYW5nZSB3aGF0IHRoZSBkb2N1bWVudGF0aW9uIHdpbGwKPiBsb29r
IGxpa2UgaW4gdGhlIEhUTUwgYW5kIFBERiBvdXRwdXQgZm9ybXMsIGFuZCBJIHRoaW5rIGl0IHdv
dWxkIG1ha2UKPiBsaWZlIGVhc2llciBmb3IgcGVvcGxlIGFyZSByZWFkaW5nIGFuZCBlZGl0aW5n
IHRoZSBEb2N1bWVudGF0aW9uLyoKPiBmaWxlcyBpbiB0ZXh0IGZvcm0uCgpBZ3JlZWQuIEknbSBh
bHNvIGNvbnNpZGVyaW5nIHRvIGFkZCBhIGNvdXBsZSBvZiBjYXNlcyBvZiB0aGlzIGNoYXI6CgoJ
LSBVKzIwMjYgKCfigKYnKTogSE9SSVpPTlRBTCBFTExJUFNJUwoKQXMgU3BoaW54IGFsc28gcmVw
bGFjZXMgIi4uLiIgaW50byBIT1JJWk9OVEFMIEVMTElQU0lTLgoKLQoKQW55d2F5LCBJJ20gb3B0
aW5nIHRvIHN1Ym1pdHRpbmcgdGhvc2UgaW4gc2VwYXJhdGUgYmVjYXVzZSBpdCBzZWVtcwp0aGF0
IGF0IGxlYXN0IHNvbWUgbWFpbnRhaW5lcnMgYWRkZWQgRU0vRU4gREFTSCBpbnRlbnRpb25hbGx5
LgoKU28sIGl0IG1heSBnZW5lcmF0ZSBjYXNlLXBlci1jYXNlIGRpc2N1c3Npb25zLgoKQWxzbywg
SU1PLCBhdCBsZWFzdCBhIGNvdXBsZSBvZiBFTi9FTSBEQVNIIGNhc2VzIHdvdWxkIGJlIGJldHRl
ciBzZXJ2ZWQgCndpdGggYSBzaW5nbGUgaHlwaGVuLgoKVGhhbmtzLApNYXVybwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwg
bWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
