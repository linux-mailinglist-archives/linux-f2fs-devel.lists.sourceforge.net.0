Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4F81BD3DC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Apr 2020 06:59:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jTeoH-0006cp-44; Wed, 29 Apr 2020 04:59:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1jTeoG-0006cc-5T
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Apr 2020 04:59:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SgBgKEZAF4DZDU8n6TNtN6h7mhMj7SRUEgP91LQZcK4=; b=QL84D3LWpZQx3MLSfVNxGpUp5o
 Ep70eZEDTtTlIeiz5CizcCA5IP/ldrkgnXRhgr1kQd3/h6djCI3GdHl2zfIiaPSVmSletXN+hPZD8
 6LgxzjpORyQ35ncaxOigusmQggDYgsuZ31nFQGEx/Necbp7luyGUqj/IEzcCNA/7KPFo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SgBgKEZAF4DZDU8n6TNtN6h7mhMj7SRUEgP91LQZcK4=; b=kAvf790KwwnNk8AAfLxDxkHzyU
 K1SG0MuohOixKvrumXSrgkz0MjKzweFlT7NaX2oDOAVTqV9CwRdCkHN2DTlise6cVxQCFCJnYotQi
 Lw9tSrIXdqE8jPWgfeNY0iCQV/nH3v6qTXCdoOfqlaOZpM99wAgTvqEiItbWIbLdVOk0=;
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jTeo7-001shV-4s
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Apr 2020 04:59:00 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1588136336; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=SgBgKEZAF4DZDU8n6TNtN6h7mhMj7SRUEgP91LQZcK4=;
 b=fQ1+JDli135bEEjZEXBs+aXWHcjGCyp0YaQzGpmt85pO2VUKdKZrQo/LaZnVpVMdQO/UuWgg
 KlBtCr9M16DxKfwMLhtHdmgPjGpRc/TNDiBlD4/Fq7l77LUbcUDhryDQmJb/9bVs8qbgvC+X
 eyvZuosvFtLJEUWsWPFoxdJCxJ0=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea90981.7f006a381998-smtp-out-n02;
 Wed, 29 Apr 2020 04:58:41 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3011DC433BA; Wed, 29 Apr 2020 04:58:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.101] (unknown [183.83.143.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: sayalil)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0FD72C433D2;
 Wed, 29 Apr 2020 04:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0FD72C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=sayalil@codeaurora.org
To: Markus Elfring <Markus.Elfring@web.de>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
References: <07a820a2-b3b3-32ca-75ce-ceaca106d2c6@web.de>
From: Sayali Lokhande <sayalil@codeaurora.org>
Message-ID: <433d4ad5-22e5-fd2b-cab3-9752ed0c66fb@codeaurora.org>
Date: Wed, 29 Apr 2020 10:28:36 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <07a820a2-b3b3-32ca-75ce-ceaca106d2c6@web.de>
Content-Language: en-US
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [104.130.122.27 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jTeo7-001shV-4s
Subject: Re: [f2fs-dev] [PATCH V2] f2fs: Avoid double lock for cp_rwsem
 during checkpoint
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgTWFya3VzCgpPbiA0LzI3LzIwMjAgNDowOCBQTSwgTWFya3VzIEVsZnJpbmcgd3JvdGU6Cj4+
IOKApiBUaGlzIHJlc3VsdHMgaW4gZGVhZGxvY2sgYXMKPj4gaXB1dCgpIHRyaWVzIHRvIGhvbGQg
Y3BfcndzZW0sIHdoaWNoIGlzIGFscmVhZHkgaGVsZCBhdCB0aGUKPj4gYmVnaW5uaW5nIGJ5IGNo
ZWNrcG9pbnQtPmJsb2NrX29wZXJhdGlvbnMoKS4KPiBXaWxsIGFub3RoZXIgaW1wZXJhdGl2ZSB3
b3JkaW5nIGJlY29tZSBoZWxwZnVsIGJlc2lkZXMgdGhlIHByb3ZpZGVkIGluZm9ybWF0aW9uCj4g
Zm9yIHRoaXMgY2hhbmdlIGRlc2NyaXB0aW9uPwo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRp
b24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0P2lkPTZhOGI1NWVkNDA1NmVhNTU1OWVi
ZTRmNmE0YjI0N2Y2Mjc4NzBkNGMjbjE1MQo+Cj4gV291bGQgeW91IGxpa2UgdG8gYWRkIHRoZSB0
YWcg4oCcRml4ZXPigJ0gYmVjYXVzZSBvZiBhZGp1c3RtZW50cwo+IGZvciB0aGUgZGF0YSBzeW5j
aHJvbmlzYXRpb24/CgpJIGNvdWxkbid0IGZpbmQgYW55IHBhc3QgY29tbWl0IHdoaWNoIHN1aXRz
IHRvIGJlIGFkZGVkIHVuZGVyICJGaXhlcyIgCmhlcmUuIExldCBtZSBrbm93IGlmIHlvdSBoYXZl
IGFueSBvdGhlciBjb21tZW50LgoKPgo+IFJlZ2FyZHMsCj4gTWFya3VzCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWls
aW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
