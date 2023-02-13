Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CF96940F9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Feb 2023 10:25:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pRV5R-0006Pu-9c;
	Mon, 13 Feb 2023 09:25:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pRV5N-0006Pn-Ou
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Feb 2023 09:25:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H5aC8or+oFmQy61a7+/ZQEsYBSaVY7sE0TPB21YfZds=; b=YcNHRQuI3YLHQVYjmAgbkse0vK
 fPJFbijvlhPxpAkeDpi4qYuZQ5UyTxaYK3+7lGOcMDBfVkRGkN0YOz3pxm6PU3dxotY9GCvlRjfLB
 TfaZKsispdPMRZmrzFTfLGfif6hV868qFtO9IN1kHiV2pUtcUM+ARth+jOfHtuCGUcjA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H5aC8or+oFmQy61a7+/ZQEsYBSaVY7sE0TPB21YfZds=; b=WhKjS3mzZmllSqpv0VBvmxt6it
 WbRd0o3P6YF5hT6y2sHhgGbTqCfa1aOu8PwclZkWVtbKesOuavjJj446SStDd99T1AL9R6y0fu3PW
 +35q+fmTtZ5t4VSHP08OL7fDWOzEYxcTxUexfq2fgIRlkMoZPjtULiWyFjvPtJvY92nI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pRV5H-002cqP-Qq for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Feb 2023 09:25:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6414B60F29;
 Mon, 13 Feb 2023 09:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48F7AC433A7;
 Mon, 13 Feb 2023 09:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676280310;
 bh=VnuDtpouDgwVlLpnixSYPUGpmwgIa3hlM9urXtzlhvg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cRNuUwUcjQDnPdZQD2RIdYo4Yr0z57XZwJhizae7btX0J9GC1zhxjjR4tfcNfVYet
 qfXMe36aMspV4xTrWlWAd7iKeV1BGGPFAlTdetowW6mufHflCDDpbJYpm3swDixG1i
 PyCyI9PG4tgTG0fr/VrocRGgZDWTnqbDGz0XTyvDm6JnnvqB9NWg3LIvQnX6mWHVv9
 blRK4T6NExG9/er6CBkJ/pMrI0MLxtSOg5o4zPD2bEazKrpyt6KKdfJbNb2f2QepHa
 yAn+fJ7qP7PsJbAyXQqmdFvMKrrj8Qn0I87GWCxVvn+8i8ulICItLQE+LC8nkAkFpf
 QYLZMhaQwmsFg==
Message-ID: <cc338b66-f0f5-d9b7-81d3-b15bccc9d463@kernel.org>
Date: Mon, 13 Feb 2023 17:25:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
To: =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230209-kobj_type-f2fs-v1-1-b6feedbdd4a8@weissschuh.net>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230209-kobj_type-f2fs-v1-1-b6feedbdd4a8@weissschuh.net>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2023/2/9 11:20, Thomas Weißschuh wrote: > Since commit
    ee6d3dd4ed48 ("driver core: make kobj_type constant.") > the driver core
   allows the usage of const struct kobj_type. > > Take advantage of th [...]
    
 
 Content analysis details:   (-5.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pRV5H-002cqP-Qq
Subject: Re: [f2fs-dev] [PATCH] f2fs: make kobj_type structures constant
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMy8yLzkgMTE6MjAsIFRob21hcyBXZWnDn3NjaHVoIHdyb3RlOgo+IFNpbmNlIGNvbW1p
dCBlZTZkM2RkNGVkNDggKCJkcml2ZXIgY29yZTogbWFrZSBrb2JqX3R5cGUgY29uc3RhbnQuIikK
PiB0aGUgZHJpdmVyIGNvcmUgYWxsb3dzIHRoZSB1c2FnZSBvZiBjb25zdCBzdHJ1Y3Qga29ial90
eXBlLgo+IAo+IFRha2UgYWR2YW50YWdlIG9mIHRoaXMgdG8gY29uc3RpZnkgdGhlIHN0cnVjdHVy
ZSBkZWZpbml0aW9ucyB0byBwcmV2ZW50Cj4gbW9kaWZpY2F0aW9uIGF0IHJ1bnRpbWUuCj4gCj4g
U2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPGxpbnV4QHdlaXNzc2NodWgubmV0PgoK
UmV2aWV3ZWQtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KClRoYW5rcywKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
