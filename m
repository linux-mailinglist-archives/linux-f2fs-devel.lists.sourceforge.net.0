Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED43379D8C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 May 2021 05:17:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgItJ-0003zc-CU; Tue, 11 May 2021 03:17:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <yuchao0@huawei.com>) id 1lgIt6-0003z9-M2
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 May 2021 03:16:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NlsFk3+S7Zwc7ljex/5PfGpD98/QyUxR27v59+RzHCU=; b=kj+1r9HcSIPL9BcS8/x4cnWJsN
 q436Q0Fm9cl1pi76i/WeDSbfdhku52pE81une2eDpJ2YKOEvW6+/nTQUw+R2FFBoBu3VFsfh4CWOn
 ixuYuT5DKJjk3S8ChMpq0nmS1LK6kUDdhsRd7A8bYCeVDvUVDK+zE21pBbdX2wOfQATE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NlsFk3+S7Zwc7ljex/5PfGpD98/QyUxR27v59+RzHCU=; b=Yrq6ToQQYb00kfOp5gAnanSBd9
 bAvwU/mDAy9uZCMDD+uu2uP51DYijj0C9PKbTKcxs/vaUn80DokMUD+tbf3ntEowZO+Hf0iE5ZCFi
 cipFpZugSoybaPJZLFKZdyfeI0aQVEvOLZxYtes9VYJjaVHANDpsWSCcWzGAbo6Vm9N8=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lgIt1-003KYT-Ol
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 May 2021 03:16:49 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FfNKP69qJzmg6H;
 Tue, 11 May 2021 11:13:13 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 11 May
 2021 11:16:29 +0800
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <c320db751bc326efbd1d619c0f8007d9965a32ab.1620641727.git.mchehab+huawei@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <5454cb69-1193-83e2-754d-7d8807ad12e5@huawei.com>
Date: Tue, 11 May 2021 11:16:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <c320db751bc326efbd1d619c0f8007d9965a32ab.1620641727.git.mchehab+huawei@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lgIt1-003KYT-Ol
Subject: Re: [f2fs-dev] [PATCH 27/53] docs: filesystems: f2fs.rst: avoid
 using UTF-8 chars
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS81LzEwIDE4OjI2LCBNYXVybyBDYXJ2YWxobyBDaGVoYWIgd3JvdGU6Cj4gV2hpbGUg
VVRGLTggY2hhcmFjdGVycyBjYW4gYmUgdXNlZCBhdCB0aGUgTGludXggZG9jdW1lbnRhdGlvbiwK
PiB0aGUgYmVzdCBpcyB0byB1c2UgdGhlbSBvbmx5IHdoZW4gQVNDSUkgZG9lc24ndCBvZmZlciBh
IGdvb2QgcmVwbGFjZW1lbnQuCj4gU28sIHJlcGxhY2UgdGhlIG9jY3VyZW5jZXMgb2YgdGhlIGZv
bGxvd2luZyBVVEYtOCBjaGFyYWN0ZXJzOgo+IAo+IAktIFUrMjAxMyAoJ+KAkycpOiBFTiBEQVNI
Cj4gCS0gVSsyMDFjICgn4oCcJyk6IExFRlQgRE9VQkxFIFFVT1RBVElPTiBNQVJLCj4gCS0gVSsy
MDFkICgn4oCdJyk6IFJJR0hUIERPVUJMRSBRVU9UQVRJT04gTUFSSwo+IAo+IFNpZ25lZC1vZmYt
Ynk6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYitodWF3ZWlAa2VybmVsLm9yZz4KClJl
dmlld2VkLWJ5OiBDaGFvIFl1IDx5dWNoYW8wQGh1YXdlaS5jb20+CgpUaGFua3MsCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZl
bCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0
cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZl
bAo=
