Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E4E6530A7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Dec 2022 13:16:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p7y1h-0006T2-05;
	Wed, 21 Dec 2022 12:16:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p7y1f-0006Sn-Dw
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Dec 2022 12:16:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mGReGE4lsrUm5KqBq8MuZga7K8uZYEs3uap78ggLTJE=; b=dnvKKKNbHl3ULxiUjNbReQByf2
 FOxHIQM6vIMHaxHk/JJwNz8UijWFx9JjHX/yYVwV9tuaHny5Du1OCbn43AS/NZi7jHgIdo0aEDEkj
 wX3DqAiKtIo2udcTAIEBpL3CJFkplfi5UMoK0IevTsP/cqseGHFSyP2/ynK/rfK/N1BE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mGReGE4lsrUm5KqBq8MuZga7K8uZYEs3uap78ggLTJE=; b=WdVuonnpB8CSlJu90bnVaRQw21
 b5Swe9c0o6R5Bke1GMfssSXZ/8wNK+Vs5opOi5l9vJJvukqrOqpJ0aHDRINSGQyb6+5g9MeIzcO0c
 pi/DcBhHn/cwlwrF5RWulDeOussF9niWK7B5ex5S05+133Hk5xDTX9xHuzCtQj0+KuvM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p7y1e-0007nB-QJ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Dec 2022 12:16:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6D0FD61791;
 Wed, 21 Dec 2022 12:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4605C433D2;
 Wed, 21 Dec 2022 12:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671625000;
 bh=7IM2aHE5t1+x4/OQ3TByOnA+TDFUo5eLGDBp/nA9VB0=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=oel60HDJEypHqq7AJ/RutVm98b22o3dB4VyhDep4t5DOAxPKY2q8bzHHkxtvmuqsm
 WCjoozbmePffEA1/6C02H4rOz5CkSeJ94w+IeQARUupcfDGz7jp1mlEItffC8HU5YW
 J8qQ+23sJM9PPB4yAhtyvMKhp6JYhwg0/khRwVx6QOd9Do0Pg3QEzWPLijnic1M+SK
 rRiaiw1t65f5FV15SXz0pgMHAahkygMh01m4fRgiVz1envThdg8dRfzWqu2oJopPTO
 uEQfVEZi/x0r+4zl77bQINMxUjKc5dSWbbwgImyN60ys/yPPsZcqEH8FlnIznM0QgR
 X0A/fJrGuyxrA==
Message-ID: <32ae9221-0b5c-f12e-4795-5fe1f725cb2c@kernel.org>
Date: Wed, 21 Dec 2022 20:16:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221220115602.6715-1-chao@kernel.org>
 <20221221035931.41027-1-frank.li@vivo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221221035931.41027-1-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2022/12/21 11:59, Yangtao Li wrote: >> PAGE_PRIVATE_GET_FUNC(reference,
    REF_RESOURCE); > >> PAGE_PRIVATE_CLEAR_FUNC(reference, REF_RESOURCE); > >
    Delete those two too? Oh, thank for checking PAGE_PRIVATE_REF_RESOURCE's
   usage, I found we need clear_page_private_reference(), see “[PATCH] f2fs:
    fix to call clear_page_private_reference in .{release,invalid}_folio” 
 
 Content analysis details:   (-7.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p7y1e-0007nB-QJ
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove unused PAGE_PRIVATE_ATOMIC_WRITE
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

T24gMjAyMi8xMi8yMSAxMTo1OSwgWWFuZ3RhbyBMaSB3cm90ZToKPj4gICBQQUdFX1BSSVZBVEVf
R0VUX0ZVTkMocmVmZXJlbmNlLCBSRUZfUkVTT1VSQ0UpOwo+ICAgCj4+ICAgUEFHRV9QUklWQVRF
X0NMRUFSX0ZVTkMocmVmZXJlbmNlLCBSRUZfUkVTT1VSQ0UpOwo+IAo+IERlbGV0ZSB0aG9zZSB0
d28gdG9vPwoKT2gsIHRoYW5rIGZvciBjaGVja2luZyBQQUdFX1BSSVZBVEVfUkVGX1JFU09VUkNF
J3MgdXNhZ2UsIEkgZm91bmQgd2UKbmVlZCBjbGVhcl9wYWdlX3ByaXZhdGVfcmVmZXJlbmNlKCks
IHNlZSDigJxbUEFUQ0hdIGYyZnM6IGZpeCB0byBjYWxsCmNsZWFyX3BhZ2VfcHJpdmF0ZV9yZWZl
cmVuY2UgaW4gLntyZWxlYXNlLGludmFsaWR9X2ZvbGlv4oCdCgpUaGFua3MsCgo+IAo+IE90aGVy
d2lzZSwgbG9va3MgZ29vZCB0byBtZS4KPiAKPiBUaHgsCj4gWWFuZ3RhbwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
