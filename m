Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A2846B193DE
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  3 Aug 2025 13:34:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8EFchbioU12MEWf49gnwA2oJ9na+repD945ph9/PJp0=; b=Sc5zvLlNBWaAg/6aCqsFoE4sRe
	6uMkm+VT5Lps28bkgXitEwho5PJpLdZtQ+UYMyZSeD6taMwyrUkqlVA3iFQHycQxoYoEh1tu8CTps
	lqjjCPDrCsMdZqdWktlgluj5xzjYTcYn7AZ3CMcneDx3sg48bTm0M0QY8/ELH7xLakAg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uiWyV-0007Ta-Iu;
	Sun, 03 Aug 2025 11:33:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Markus.Elfring@web.de>) id 1uiWyT-0007TT-Pt
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 Aug 2025 11:33:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:Subject:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gh7UCBKW2ZKQxPll5m7Nb+1o4NiEmFKs7C57wXfPSRU=; b=AOwcoAJXcNOibhLcLad7jTsi3K
 d1v9Jrt56mvjEXWFvHdmzsGvmiNk/yhFan+wfGeD3LIVTQSP1P5s2xPvBy78TUbOLZa/HfUHGKpwG
 9URf1Q9SBQFLYzV7/bZ8+TkJg8SFa1P5f0hdFq5ahN9EwFXIKTexure7/DZshrfB0fbg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Subject:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Gh7UCBKW2ZKQxPll5m7Nb+1o4NiEmFKs7C57wXfPSRU=; b=Cy89WxZmDaT7335tMx5KEqamyO
 xWfTOMPMpwotCRtua7PTbkwWEOyUVWTibVaBGXss2ZMz8awANjg+58Z+r1vll+SNVSs3F89x8kJIo
 aO0LTk2mmcLBe+7lW70dC9vS/oNlIlNjrdca3sguTMOB6YlXPdpGb7orfQC9SEIc8P0c=;
Received: from mout.web.de ([212.227.15.4])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uiWyS-0001q3-Nx for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 Aug 2025 11:33:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1754220800; x=1754825600; i=markus.elfring@web.de;
 bh=Gh7UCBKW2ZKQxPll5m7Nb+1o4NiEmFKs7C57wXfPSRU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=mfLsUteU3aJJzlkdPiG8xyUUyghYZEB5NEzoIroR6s6OjCa43rHuvkRPMf/lYnvb
 66PJsEyr+hh8MbWdKyn8prwGWO8PhYoS3lD9xTG/8J4SAmEbm/dC50dn0c8ZK9UMO
 lVrSoKkmqsJEI1ZZB1njjTkqXMheESIUIDqHgMDgg1CbX7bCq2DCKJB+GLqvwS+a3
 k5kE4dp1qjTOlh520rG5DdwOLxWaBpVhehyisChXYYeiNGde9Sf+yZOY4i6uFtJ9Q
 yXh4sO0iG5vO/jzWBXk+ysJIdWoqljLJfyT5xwl0eYkl6ka5ICYrXt8jFML4epx7P
 hgozFkXg7hCk0jfI1w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.186]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MuVKI-1uQSBO1Hpi-014Tvv; Sun, 03
 Aug 2025 13:33:20 +0200
Message-ID: <4688e9e4-fc41-4d0d-9948-e729c812c346@web.de>
Date: Sun, 3 Aug 2025 13:33:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250802023733.1890349-1-chao@kernel.org>
Content-Language: en-GB, de-DE
In-Reply-To: <20250802023733.1890349-1-chao@kernel.org>
X-Provags-ID: V03:K1:7VD/TlZYC1Ka7SadUjhBeJ2MVGkbzvfIbkpUsQ4rzyumGV6vS3l
 6x2QSTEmBmsf4utM+W9WPQul/e5uT26EegoHtGGxXlWWOHrCJRY5WZVH1VRPAqm8rLpJ774
 xW3HcDuiD8ysS84TwRMkFwgWQWe/OjFBNKaNV8efxQlIFJAa5wKm6xNw1LfPK4lVypl/PGf
 GGQVu0MdnEzPdbPVWca/g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wrGSbDtvmtM=;KMGN6RZyBSE/W5y9lzBzNUqKqjb
 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
 x2DVzdOEkz/XR03MES+v4j0=
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  … > +++ b/fs/f2fs/file.c > @@ -5185,6 +5185,11 @@ static
    ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from) >
    goto out; > } > > + if (iocb->ki_flags & IOCB_DONTCACHE) { > + ret [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [markus.elfring(at)web.de]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [212.227.15.4 listed in wl.mailspike.net]
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uiWyS-0001q3-Nx
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to return -EOPNOTSUPP for uncached
 write
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
From: Markus Elfring via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Markus Elfring <Markus.Elfring@web.de>
Cc: Jens Axboe <axboe@kernel.dk>, Qi Han <hanqi@vivo.com>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

4oCmCj4gKysrIGIvZnMvZjJmcy9maWxlLmMKPiBAQCAtNTE4NSw2ICs1MTg1LDExIEBAIHN0YXRp
YyBzc2l6ZV90IGYyZnNfZmlsZV93cml0ZV9pdGVyKHN0cnVjdCBraW9jYiAqaW9jYiwgc3RydWN0
IGlvdl9pdGVyICpmcm9tKQo+ICAJCWdvdG8gb3V0Owo+ICAJfQo+ICAKPiArCWlmIChpb2NiLT5r
aV9mbGFncyAmIElPQ0JfRE9OVENBQ0hFKSB7Cj4gKwkJcmV0ID0gLUVPUE5PVFNVUFA7Cj4gKwkJ
Z290byBvdXQ7Cj4gKwl9Cj4gKwo+ICAJaWYgKCFmMmZzX2lzX2NvbXByZXNzX2JhY2tlbmRfcmVh
ZHkoaW5vZGUpKSB7Cj4gIAkJcmV0ID0gLUVPUE5PVFNVUFA7Cj4gIAkJZ290byBvdXQ7CgpDYW4g
aXQgYmUgYXZvaWRlZCB0byBzcGVjaWZ5IGR1cGxpY2F0ZSBleGNlcHRpb24gaGFuZGxpbmc/Ck1h
eSB0aGUgY29uZGl0aW9uIGNoZWNrcyBiZSBtZXJnZWQgZm9yIHRoZXNlIGlmIHN0YXRlbWVudHM/
CgpSZWdhcmRzLApNYXJrdXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVs
QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0
cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
