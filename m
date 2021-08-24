Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC66B3F5912
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Aug 2021 09:34:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mIQxA-0001xp-5v; Tue, 24 Aug 2021 07:34:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <hch@lst.de>) id 1mIQx8-0001xh-8O
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Aug 2021 07:34:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gehM2WKxHH1B4AL/C/4lL1kYrNjdeny73C8bGJxG9UY=; b=ZS7Y94OGyq+GqObcb8m+8ony+M
 T5LqzdRVPw0Pf/P0oaSA910djnXMaiVG6auliZB1QHfPJtytwihjxIGKlFaXZxD536UBimgguzdXT
 PwqMIGYfhdjIcb1zvjAV/ysnRVVO6FYsYlYbHQ30qGH4VB7kAiaijMY0Oj+fGExfOJZc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gehM2WKxHH1B4AL/C/4lL1kYrNjdeny73C8bGJxG9UY=; b=MyK4QqmRohNc9cR9zRbBxPFHBm
 Hn0WCNB+SrXUeRgNpEkyr2wb7t9DTB5JqxBc80Fw2ErEJA3dC2ItCDqEsq79VNtvy2I5H7em22lMx
 kn8WUQz6ysWyDwqY3FR/MBcDb/g/fN6jHj+NTOMYJMrQEduNvDpO4i3SApaJuNyDjuhE=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mIQx3-0007Go-6P
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Aug 2021 07:34:34 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1B37B67373; Tue, 24 Aug 2021 09:34:19 +0200 (CEST)
Date: Tue, 24 Aug 2021 09:34:18 +0200
From: Christoph Hellwig <hch@lst.de>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <20210824073418.GA25209@lst.de>
References: <20210818140651.17181-1-hch@lst.de>
 <20210818140651.17181-6-hch@lst.de> <87tujg19wj.fsf@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87tujg19wj.fsf@collabora.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1mIQx3-0007Go-6P
Subject: Re: [f2fs-dev] [PATCH 05/11] unicode: pass a UNICODE_AGE() tripple
 to utf8_load
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Shreeya Patel <shreeya.patel@collabora.com>, Christoph Hellwig <hch@lst.de>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBBdWcgMjMsIDIwMjEgYXQgMTE6MDI6NTJBTSAtMDQwMCwgR2FicmllbCBLcmlzbWFu
IEJlcnRhemkgd3JvdGU6Cj4gSSByZW1lbWJlciB0aGlzIGZhbGxiYWNrIHdhcyBzcGVjaWZpY2Fs
bHkgcmVxdWVzdGVkIGR1cmluZyBhIHJldmlldyBvcgo+IGluIGEgZGlzY3Vzc2lvbiwgYnV0IEkg
aG9uZXN0bHkgY2Fubm90IHJlbWVtYmVyIHRoZSByZWFzb24uCj4gCj4gT25lIGFkdmFudGFnZSBJ
IGNhbiB0aGluayBpcyBpZiB3ZSBoYXZlIGEgZmlsZXN5c3RlbSB0aGF0IHJlcXVpcmVzIGEKPiBu
ZXdlciB1bmljb2RlIHZlcnNpb24gdGhhbiB0aGUgY3VycmVudCBrZXJuZWwgaGFzLCBhbmQgc3Ry
aWN0IG1vZGUgZmxhZwo+IGlzIHNldCwgd2UgY2FuIGZhbGxiYWNrIHRvIHRoZSBsYXRlc3QgdmVy
c2lvbiBhbmQgc3RpbGwgbW91bnQgdGhlIGZzCj4gcmVhZC93cml0ZS4KCldlbGwsIHRoYXQgc2Vl
bXMgYSBsaXR0bGUgcG9pbnRsZXNzLiAgSWYgd2UgYWRkIHN1Y2ggYSBmaWxlIHN5c3RlbQp3ZSBj
YW4ganVzdCB1cGdyYWRlIHRoZSB1btGWY29kZSBkYXRhIGZpbGVzLiAgKEZZSSwgSSBkaWQgYW4g
dXBncmFkZQp0byAxLjEzIHRvIHRlc3QgdGhpcyBzZXJpZXMsIGJ1dCB3aXRob3V0IGFueSBmaWxl
IHN5c3RlbSB0aGF0IG5lZWRzCml0IEkgZGlkIG5vdCBib3RoZXIgdG8gc3VibWl0IHRoZSBwYXRj
aCkuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAo=
