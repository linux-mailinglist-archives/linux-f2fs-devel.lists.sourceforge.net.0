Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC0237A38F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 May 2021 11:25:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgOdv-0002Ru-6c; Tue, 11 May 2021 09:25:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1lgOdt-0002RC-So; Tue, 11 May 2021 09:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SxEDkhQ4NDmmQJU/qD2f8WKt2ZN30zjdTiLd/JmT63A=; b=HbyOCeVJw/BgL2URJiv4dAGEFm
 gbiKlJUwfJdOu9N1mtLEBoVvWkLbV+gGBB0kp4c3/GjYYDZtbLwBraYhMmIpzm5QDqtEMT5a8bl+W
 i7WGzQRndZkAuIt8usLAbVEU1qxwnZdKOP8BjWX1ndaJlfTcNGvfmfU27FmqwQb/pJnM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SxEDkhQ4NDmmQJU/qD2f8WKt2ZN30zjdTiLd/JmT63A=; b=bkf3rAM4RQQLECbXU4hRJ1ytLU
 vg5fA4P6TuifqG/RmSZLA+tUUFDBM/BomsM8umQqCnyYSu5ApdSVIYh/5ge1w+/CVSMAcmXa0taOp
 /wwRdWGuE3R70tVpNNE+wW0hWMTNT/fqVnmjIPtLZRrLmLYjc22oIGsAIICGsR4A29pk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lgOdp-0002ee-JN; Tue, 11 May 2021 09:25:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BAA5561469;
 Tue, 11 May 2021 09:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620725119;
 bh=SxEDkhQ4NDmmQJU/qD2f8WKt2ZN30zjdTiLd/JmT63A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qYIzsO6/tiOl8TGJ6a2eiShRAv5ZaMzH0UMz1Okj8KRt9xtY+LR/anIcVUrTbZiX4
 89BZ53+EXyXMYuHsL+U06kiuxNXt/5HwXMQCdDP/VjD4quHGFE+7gbD3gJVXax5DaY
 uPQ39ZXYcixN6FyJ12+nOvdmqwpol10wPiVFzbtkGhu9sXEQXyPXQcHwYGaPn1WAFe
 4EHVQRoUTs78Ah0GJIhGex565u4aOD5+o97KCk6BlvJCrZe2QVlJEyby3BUR9BJh2D
 ihJkCCdqkHc4Kaa3576AZpMqo1MX3GKHjJMVLdhoGH+hccpOnzojw8qINBpykxkRxP
 IMzqRB+GVylEA==
Date: Tue, 11 May 2021 11:25:08 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20210511112508.4547bca8@coco.lan>
In-Reply-To: <de6d1fa5b7934f4afd61370d9c58502bef588466.camel@infradead.org>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <2ae366fdff4bd5910a2270823e8da70521c859af.camel@infradead.org>
 <20210510135518.305cc03d@coco.lan>
 <de6d1fa5b7934f4afd61370d9c58502bef588466.camel@infradead.org>
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
X-Headers-End: 1lgOdp-0002ee-JN
Subject: Re: [f2fs-dev] [PATCH 00/53] Get rid of UTF-8 chars that can be
 mapped as ASCII
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
 linux-pci@vger.kernel.org, linux-fpga@vger.kernel.org,
 dri-devel@lists.freedesktop.org, keyrings@vger.kernel.org,
 linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, x86@kernel.org, linux-acpi@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 linux-ext4@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-sgx@vger.kernel.org, coresight@lists.linaro.org, rcu@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RW0gTW9uLCAxMCBNYXkgMjAyMSAxNDo0OTo0NCArMDEwMApEYXZpZCBXb29kaG91c2UgPGR3bXcy
QGluZnJhZGVhZC5vcmc+IGVzY3JldmV1OgoKPiBPbiBNb24sIDIwMjEtMDUtMTAgYXQgMTM6NTUg
KzAyMDAsIE1hdXJvIENhcnZhbGhvIENoZWhhYiB3cm90ZToKPiA+IFRoaXMgcGF0Y2ggc2VyaWVz
IGlzIGRvaW5nIGNvbnZlcnNpb24gb25seSB3aGVuIHVzaW5nIEFTQ0lJIG1ha2VzCj4gPiBtb3Jl
IHNlbnNlIHRoYW4gdXNpbmcgVVRGLTguIAo+ID4gCj4gPiBTZWUsIGEgbnVtYmVyIG9mIGNvbnZl
cnRlZCBkb2N1bWVudHMgZW5kZWQgd2l0aCB3ZWlyZCBjaGFyYWN0ZXJzCj4gPiBsaWtlIFpFUk8g
V0lEVEggTk8tQlJFQUsgU1BBQ0UgKFUrRkVGRikgY2hhcmFjdGVyLiBUaGlzIHNwZWNpZmljCj4g
PiBjaGFyYWN0ZXIgZG9lc24ndCBkbyBhbnkgZ29vZC4KPiA+IAo+ID4gT3RoZXJzIHVzZSBOTy1C
UkVBSyBTUEFDRSAoVStBMCkgaW5zdGVhZCBvZiAweDIwLiBIYXJtbGVzcywgdW50aWwKPiA+IHNv
bWVvbmUgdHJpZXMgdG8gdXNlIGdyZXBbMV0uICAKPiAKPiBSZXBsYWNpbmcgdGhvc2UgbWFrZXMg
c2Vuc2UuIEJ1dCByZXBsYWNpbmcgZW1kYXNoZXMg4oCUIHdoaWNoIGFyZSBhCj4gZGlzdGluY3Qg
Y2hhcmFjdGVyIHRoYXQgaGFzIG5vIGRpcmVjdCByZXBsYWNlbWVudCBpbiBBU0NJSSBhbmQgd2hp
Y2gKPiBwZW9wbGUgZG8gKmRlbGliZXJhdGVseSogdXNlIGluc3RlYWQgb2YgaHlwaGVuLW1pbnVz
IOKAlCBkb2VzIG5vdC4KPiAKPiBQZXJoYXBzIHN0aWNrIHRvIHRob3NlIHR3bywgYW5kIGFueSBj
YXNlcyB3aGVyZSBhbiBlbWRhc2ggb3IgZW5kYXNoIGhhcwo+IGJlZW4gdXNlZCB3aGVyZSBVKzAw
MkQgSFlQSEVOLU1JTlVTICpzaG91bGQqIGhhdmUgYmVlbiB1c2VkLgoKT2suIEknbGwgcmV3b3Jr
IHRoZSBzZXJpZXMgZXhjbHVkaW5nIEVNL0VOIERBU0ggY2hhcnMgZnJvbSBpdC4KSSdsbCB0aGVu
IGFwcGx5IG1hbnVhbGx5IHRoZSBjaGFuZ2VzIGZvciBFTS9FTiBEQVNIIGNoYXJzIAoocHJvYmFi
bHkgb24gYSBzZXBhcmF0ZSBzZXJpZXMpIHdoZXJlIGl0IHNlZW1zIHRvIGZpdC4gVGhhdCBzaG91
bGQKbWFrZSBlYXNpZXIgdG8gZGlzY3VzcyBzdWNoIHJlcGxhY2VtZW50cy4KCj4gQW5kIHBsZWFz
ZSBmaXggeW91ciBjb3ZlciBsZXR0ZXIgd2hpY2ggbWFkZSBubyByZWZlcmVuY2UgdG8gJ2dyZXAn
LCBhbmQKPiBvbmx5IHByZXNlbnRlZCBhIGNvbXBsZXRlbHkgYm9ndXMgYXJndW1lbnQgZm9yIHRo
ZSBjaGFuZ2UgaW5zdGVhZC4KCk9LIQoKUmVnYXJkcywKTWF1cm8KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
