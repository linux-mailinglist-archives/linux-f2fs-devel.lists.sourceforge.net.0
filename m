Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A3389E7C4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Apr 2024 03:25:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ruMik-0005b7-D9;
	Wed, 10 Apr 2024 01:25:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ruMii-0005ay-Mh
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Apr 2024 01:25:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gtDeM3QBYI7TQJ6dhgKx/m96ARMHxqm9+NJcFbF/ltY=; b=l0X5AowyITmycIHrksaCnukzK7
 wFoMGCin0bMASSm9gn+CBR2vfuv8sVrT7E5YKPiqM0lsSoSGwZ/aAdrd3rFCKjkK9dBOHvXETpfu3
 fUcfNNKXJ+RyRUzLUBPtdHcPsBmXV9yp4wy4SYd41Q+um8fAAcd6M20fvPK5A0qO2XwY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gtDeM3QBYI7TQJ6dhgKx/m96ARMHxqm9+NJcFbF/ltY=; b=IYU7UACAQZ6T6i5L4y7vF7sMEw
 Jqh2YUsWV8n+GJaX3ht12Im86qAqRu8IQ9EaKNpM0I2QjbdbxaB7RQpPXhAkeBCLFs/biSNUPNuLT
 t2FpjwH5cxPkIWfchRURt+pOu7btbTVj+Ion4odw5pe+FXPLQSnVjmWPwBOfmakWSvug=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ruMiT-00085E-JP for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Apr 2024 01:25:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 47F2B61A90;
 Wed, 10 Apr 2024 01:25:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC26C433F1;
 Wed, 10 Apr 2024 01:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712712327;
 bh=Ou5zIoiVqyh7NGlOGsFz+bFF2CoeqMAsgzjLT3LU3cM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oVDyR12BfVxGXBv25opL4e4YGBJeCythNo4XuWRN8hBXxkCZBO59Qs4rphAWJbKsF
 IxUQ4rvEV5PYeMSnixqRN3elKr4mB3/Lc+ruN/GKSf0UlyVt8DQwdCY6Akj9DblSBQ
 bXBe3qHcISDy1yWLrM4FmDOWzA1MHphtNDk6R0SWEUKuICgT+p3zLyW1zqJUT24N8s
 u4/Gp5bnnCPYL+kzDV5fbz+f4Jgm6cs92h764vA1FkZ5/KSZ2oxUHTS/InUDmQHDRE
 pwv0EcN4Bex+tHja5Y6olVWeRZVgzEqaOKy69TasrhH813N5rt9WeKA9hSYcJY722l
 etrMReabFl3nQ==
Message-ID: <6a7442d9-edee-4a03-9a6c-2ff10fff121c@kernel.org>
Date: Wed, 10 Apr 2024 09:25:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20240404195254.556896-1-jaegeuk@kernel.org>
 <ZhVqwwCesxWOfbOA@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZhVqwwCesxWOfbOA@google.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/4/10 0:20, Jaegeuk Kim wrote: > Shutdown does not
 check the error of thaw_super due to readonly, which > causes a deadlock like
 below. > > f2fs_ioc_shutdown(F2FS_GOING_DOWN_FULLSYNC) issue_dis [...] 
 Content analysis details:   (0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 T_SPF_HELO_TEMPERROR   SPF: test of HELO record failed (temperror)
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1ruMiT-00085E-JP
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: don't set RO when shutting down f2fs
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
Cc: =?UTF-8?B?TGlnaHQgSHNpZWggKOisneaYjueHiCk=?= <Light.Hsieh@mediatek.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC80LzEwIDA6MjAsIEphZWdldWsgS2ltIHdyb3RlOgo+IFNodXRkb3duIGRvZXMgbm90
IGNoZWNrIHRoZSBlcnJvciBvZiB0aGF3X3N1cGVyIGR1ZSB0byByZWFkb25seSwgd2hpY2gKPiBj
YXVzZXMgYSBkZWFkbG9jayBsaWtlIGJlbG93Lgo+IAo+IGYyZnNfaW9jX3NodXRkb3duKEYyRlNf
R09JTkdfRE9XTl9GVUxMU1lOQykgICAgICAgIGlzc3VlX2Rpc2NhcmRfdGhyZWFkCj4gICAtIGJk
ZXZfZnJlZXplCj4gICAgLSBmcmVlemVfc3VwZXIKPiAgIC0gZjJmc19zdG9wX2NoZWNrcG9pbnQo
KQo+ICAgIC0gZjJmc19oYW5kbGVfY3JpdGljYWxfZXJyb3IgICAgICAgICAgICAgICAgICAgICAt
IHNiX3N0YXJ0X3dyaXRlCj4gICAgICAtIHNldCBSTyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgLSB3YWl0aW5nCj4gICAtIGJkZXZfdGhhdwo+ICAgIC0gdGhhd19zdXBl
cl9sb2NrZWQKPiAgICAgIC0gcmV0dXJuIC1FSU5WQUwsIGlmIHNiX3Jkb25seSgpCj4gICAtIGYy
ZnNfc3RvcF9kaXNjYXJkX3RocmVhZAo+ICAgIC0+IHdhaXQgZm9yIGt0aHJlYWRfc3RvcChkaXNj
YXJkX3RocmVhZCk7Cj4gCj4gUmVwb3J0ZWQtYnk6ICJMaWdodCBIc2llaCAo6Kyd5piO54eIKSIg
PExpZ2h0LkhzaWVoQG1lZGlhdGVrLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKYWVnZXVrIEtpbSA8
amFlZ2V1a0BrZXJuZWwub3JnPgoKUmV2aWV3ZWQtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4KClRoYW5rcywKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9saW51eC1mMmZzLWRldmVsCg==
