Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1398C8A62
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 May 2024 18:55:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s80rs-00063F-MS;
	Fri, 17 May 2024 16:55:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Markus.Elfring@web.de>) id 1s80rr-000639-Pg
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 May 2024 16:55:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:Subject:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=opJ3yzwn4W/yGFt1CijxFGqOb7XueZ6TGIqHxjcuutE=; b=QTlPaCG2XPybfWNRV7xGkY+s4A
 D9L8EPfJtb124neib3exLFNSrx5PL1qOMz8mPGDLXsS91+q9ZhEj3mhsbm/NK8qpWky9mPISItbXx
 AawphndE17/e75/NdGknK6XZ+4Ibm9bhmAZUkL6F4UnNAQ0w2Py0oyWYkXdQZr2cRAR0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Subject:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=opJ3yzwn4W/yGFt1CijxFGqOb7XueZ6TGIqHxjcuutE=; b=ADuSfBczoo/0GpjPwqCkYm+dnz
 6GBy5C8wBDHSfz2I28/+0Hu+DnlLrvJZ4dRrrHg6/Lrwk9ZSFlgf9zpLQ/19x1hTQcPpemhblLVun
 JMbjowe5aRhrXavWw4T3EYeyVoSwYd5oS53j3eIClb79tNgozh7yzUUp52GXhV5lNB5U=;
Received: from mout.web.de ([212.227.15.4])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s80rq-0006cu-O7 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 May 2024 16:55:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1715964921; x=1716569721; i=markus.elfring@web.de;
 bh=opJ3yzwn4W/yGFt1CijxFGqOb7XueZ6TGIqHxjcuutE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=rYPq6X2Nm3ZNWdgRT56yWY1UNvOnzO/3D0uY+m91uIkGYi2DHkhQUvl8ScoVvN1k
 vXX4N21+6TSnxw1Gi1j9mHQZOUj6jQrvHkp119OEhtmN9X+j6VQppa9pKgsBO0O7T
 6nx386VFiPY0phbLlCftuhMzxaLaHvOZ8ZDMIkMp402+bVheNAq0an7bSbfDaYSnF
 GEgvza4Hvn/DK2OL1wLC746u7Xf+sQ2PreOkmj4/R+05M6DGiPakVE24LUaQhpVsA
 UHHodsFafoPoPebIYHCK/+1EMcS+EGj1SCVA4T2ILp90VhOrYSSt3TYorIzRBZlc6
 NnBafwdaoS9r0A0M/w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MKdHE-1rrZuH0mpo-00TEYo; Fri, 17
 May 2024 18:55:21 +0200
Message-ID: <81a50343-34e3-4a4d-80e9-0c674876cdb8@web.de>
Date: Fri, 17 May 2024 18:55:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>,
 linux-f2fs-devel@lists.sourceforge.net, kernel-janitors@vger.kernel.org,
 Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <1715945202-30045-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-GB
In-Reply-To: <1715945202-30045-1-git-send-email-zhiguo.niu@unisoc.com>
X-Provags-ID: V03:K1:F5vmjCW5AwisAA6fyRSakYagc++ce9s74l6fZprZXTpp00HIYJ9
 ZPVZZxE8Ppth6r+STxzWbnVtuy86HwVhP+V9kKlQQz4xmAQM8aQQorcVkxuIh8n/ELIMVlu
 yyZQDFGQcO/ohrju1o9n4jZSwl1SaYIln0gvIvgkurlqBdH8Bw+YpWMa7y/BwyMBIuuf2gW
 mO2yhHD+4mL4lyVcU2I3Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/BR6hDIGdNA=;YrAo6ZeUPbgYxIb9yjqSQRcXuE8
 EdOcrOthGfV2mqTsHCyjDj4RVAsyaAa7hKmV0BaoaScDPXMKjX5NxSPtOpRMqygwltGUBJyB0
 fNIFBslKb7KJjb6laFkDBWcouWZ5LTV0aC/EfuFYRTekkOsmPHJ9ySrEC8tFrptwrYbfd/6Hk
 6uOWHuLck0UMdI6Q6fMEdHjSJXdJEeTnMBp0kYjgKd4nndRel80+DiA3AkF/2Wy780xvItGOU
 97RHNmK+ZHAlq28v9ZI9FNsRD9NR2UBPdVQnVnqauB12KUvsGisKYHAjJl4pejTRInUM5PMyM
 QN5yWZpnb+GyiCRm9hbOv44HaEbFDLXtk64KKPCuoCke9BkpQfmNZTPKeIFsuySomBOqWmOpy
 QZNcfEUK7mokuxJzJE1EwDH0s/nAKlA8z2k9l9HnRT5h4EwntB7Cs6qQv9y4Lygbu1c7/WjZR
 Jpms47riUmEiFjRpXsGbL9ZrKWCArHbUWv3nOUGZ3q/sGygojZHWpGquF9zE6iACXf3NvFLbW
 PmvzoX7d/Q2OHWIBDMALZjL9/5ZPYX++ula/p3oCJCdwW6u4qKaimVFNKd9qS7Lj21oBpg16W
 5Wz4AwALbWiXn+isBkwWRhbXqHNJ2PMjEJudZEQc2OYd1cuCFTU8S2T+6YE9icovNBjoldu5Z
 GGgYmCtVKtZXr5K97TRSlIFb70xc6nUd7KCiPVCQmBwBwkEwig6n5EaswclRtUZyFgwW98Jvc
 de96CE88C+euWU4i2waTWpd8iwOMPV5aTJkSVGV6AO8gHxHUCpWBL7303BMd/8T/TCVSW2N3I
 60KNP29o317ojSYDcQAWRsY+G4Ob+wGZFKytB9VGvvumc=
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  … > missed this allocated path, fix it. * Will another imperative
    wording be desirable for an improved change description? * Would you like
    to add the tag “Fixes”? 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [212.227.15.4 listed in wl.mailspike.net]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [markus.elfring[at]web.de]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1s80rq-0006cu-O7
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to check return value of
 f2fs_allocate_new_section
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
Cc: =?UTF-8?B?546L56eRIChLZSBXYW5nKQ==?= <Ke.Wang@unisoc.com>,
 LKML <linux-kernel@vger.kernel.org>, Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

4oCmCj4gbWlzc2VkIHRoaXMgYWxsb2NhdGVkIHBhdGgsIGZpeCBpdC4KCiogV2lsbCBhbm90aGVy
IGltcGVyYXRpdmUgd29yZGluZyBiZSBkZXNpcmFibGUgZm9yIGFuIGltcHJvdmVkIGNoYW5nZSBk
ZXNjcmlwdGlvbj8KCiogV291bGQgeW91IGxpa2UgdG8gYWRkIHRoZSB0YWcg4oCcRml4ZXPigJ0/
CgoqIEhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgdG8gYXBwZW5kIHBhcmVudGhlc2VzIHRvIHRoZSBm
dW5jdGlvbiBuYW1lCiAgaW4gdGhlIHN1bW1hcnkgcGhyYXNlPwoKClJlZ2FyZHMsCk1hcmt1cwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYy
ZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYy
ZnMtZGV2ZWwK
