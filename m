Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1FA1A93B9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 08:56:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jObyY-00045b-MC; Wed, 15 Apr 2020 06:56:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jObyW-00045L-S3
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 06:56:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/xPesyHWAQSRWlTYrGPFVa9MO2sGHfY9ym6iV15LEHo=; b=lEX9+OLp9dl8vxflxEkgzx5WVc
 SzE8qyeJP3JgeZr3G4F1/TXr9sZUJy29PRHQ2PO/l7hO+nZE4A6ouS9hgaIgZY0mn5XP6BBQV3ONS
 CKhTLSKKHAmGVPs22tmX5Jwzlfmhq9aaEn254CCpjhKMbAIW7aejvtDVC1Fgdg33JOAw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/xPesyHWAQSRWlTYrGPFVa9MO2sGHfY9ym6iV15LEHo=; b=QBqdikm2CiI2CbJX/QyWKya9xV
 G8yQiaH/EvM6KgmpuEhAytkAWjBimzHme0qUgu91oqtOreyfIXhzTbdwW9WKW8azXXcN3QqnI153o
 M7FeEbWgKyHywKlTfdwsf4jjosUye+2Io8D8Up8fT7Sg/EDg7+xQjT3rk96/6QBOKQkU=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jObyS-001pxy-Gj
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 06:56:44 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id A2F2BC13289DA22C7C0C;
 Wed, 15 Apr 2020 14:56:29 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 15 Apr
 2020 14:56:26 +0800
To: =?UTF-8?Q?=c3=89rico_Nogueira?= <ericonr@disroot.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20200412213435.179726-1-ericonr@disroot.org>
 <20200412213435.179726-2-ericonr@disroot.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <b7a451f4-b780-7bc9-f0e4-c60ef5bbec78@huawei.com>
Date: Wed, 15 Apr 2020 14:56:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200412213435.179726-2-ericonr@disroot.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jObyS-001pxy-Gj
Subject: Re: [f2fs-dev] [PATCH 1/1] mkfs.f2fs: update manual and help message
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi =C9rico,

On 2020/4/13 5:34, =C9rico Nogueira wrote:
> Add options that were missing from the mkfs.f2fs man page, and explain
> them more thoroughly when possible. Special care was given to document
> all the features that can be enabled during the creation of the
> filesystem.

Thanks for your good job, I think this improvement on doc will help user
a lot.

I noticed that this patch was made on top of master branch, however
in dev-test branch we have changed mkfs doc a bit, so would you please
rebase this patch to dev-test branch?

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
