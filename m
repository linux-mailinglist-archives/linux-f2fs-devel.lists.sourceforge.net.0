Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5138ECFB7BE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 07 Jan 2026 01:34:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:Message-ID:MIME-Version:References:In-Reply-To:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XDgTgJZDNGuCOi/IHN0aPbT6UoG4Fp+nDkkMTG9cmhA=; b=J6LLGHlfS3fYCpaWCUQ4Fq5rGg
	xjRmabLZbDBwAfBOwz2xyUUqwOVDpG9ZUPr6uy6g3/9/TVJCJ0+QIonATJmihsJ6DNL4sXAsmnLYv
	CAek0qMHD4ADz7JEUgsDPEqwHkzTz0r45Z6rhQ/idoCrc4tpMpwsEfbI4UcL0hOxY49I=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdHUr-0003BO-Dt;
	Wed, 07 Jan 2026 00:33:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1vdHUp-0003BC-Gc
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 00:33:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b14n04GoenhlpEjUN4mZ/1Jx9StN2ZIwIDfVlzcynDs=; b=J4hu/JnRLubSj5wKsACIAVNcl9
 iwjSi/qvtM1XbVIN8Ph4Tkq4xdwQ/RikYTboorC+FhpOhF4E1HWChY1X4ae039KJFJTcrCunscH5U
 FTcWJold/3RU/4yyD4kzbNJzGzs+0X7snTO+0Q1zIjDFfE8glfIYeKCUywxge6tto86s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:References
 :In-Reply-To:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b14n04GoenhlpEjUN4mZ/1Jx9StN2ZIwIDfVlzcynDs=; b=C2oEgBfPhjtGIykO9zL6KQZqh5
 pF9DY58qRsg7L6aea9JGblFqZH4HsIuMBtTOhOo+zZII9whVwKPX3Y3J7t2mZ2DZSoutrdqvg5UMb
 mns/bRiMj/bZqs94pCPYRSvLueg2oY9g58rfMlItyg742/DaDHIdB2+2wWjGezqfCfPg=;
Received: from m16.mail.126.com ([220.197.31.9])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdHUo-0007Vd-H5 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 00:33:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=b14n04GoenhlpEjUN4mZ/1Jx9StN2ZIwIDfVlzcynDs=; b=X
 LzLuHqRCQ39d6CXgdztCAl30+j8YvaUE0iXiY9crUz5NPPA4dQ3Vt7WUKxHUSUcB
 W75SuU54k36uxo94d+MGO5B92psFekMHfXnizQsKj+9PCumdAO7O2G53DYPAiSHq
 eDrROmCgUUShF0bnGcVmr6klCUtdsbzBggZKYTBmYs=
Received: from nzzhao$126.com ( [212.135.214.2] ) by
 ajax-webmail-wmsvr-41-116 (Coremail) ; Wed, 7 Jan 2026 08:33:27 +0800 (CST)
X-Originating-IP: [212.135.214.2]
Date: Wed, 7 Jan 2026 08:33:27 +0800 (CST)
From: "Nanzhe Zhao" <nzzhao@126.com>
To: "Chao Yu" <chao@kernel.org>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 126com
In-Reply-To: <5ca2ef6a-ce46-4d80-b2e0-ff35c628e0ba@kernel.org>
References: <20260105153101.152892-1-nzzhao@126.com>
 <20260105153101.152892-5-nzzhao@126.com>
 <5ca2ef6a-ce46-4d80-b2e0-ff35c628e0ba@kernel.org>
X-NTES-SC: AL_Qu2dBfufuUgr4SiQZOkfmUgRgOw3XMSyu/oi2o9UO5FwjA3jxyANQkF9A1fp+syAEh6ejjyRWSpN8cRKUZR/YpwOSNSqb4gLVuM1P5WLQj+kBQ==
MIME-Version: 1.0
Message-ID: <6a3d4e52.402.19b95df7350.Coremail.nzzhao@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: dCkvCgDXX6jYqV1pe4c_AA--.62730W
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsBhSImldqdhy6QAA3G
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao yu: At 2026-01-06 17:31:20, "Chao Yu" wrote: >>> diff
 --git a/fs/f2fs/data.c b/fs/f2fs/data.c >>> index 66ab7a43a56f..ac569a396914
 100644 >>> --- a/fs/f2fs/data.c >>> +++ b/fs/f2fs/data.c >> [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [212.135.214.2 listed in dnsbl-2.uceprotect.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [220.197.31.9 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vdHUo-0007Vd-H5
Subject: Re: [f2fs-dev] [PATCH v1 4/5] f2fs: add 'folio_in_bio' to handle
 readahead folios with no BIO submission
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
Cc: Kim Jaegeuk <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao yu:
At 2026-01-06 17:31:20, "Chao Yu" <chao@kernel.org> wrote:
>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>> index 66ab7a43a56f..ac569a396914 100644
>>> --- a/fs/f2fs/data.c
>>> +++ b/fs/f2fs/data.c
>>> @@ -2430,6 +2430,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>>>   	unsigned nrpages;
>>>   	struct f2fs_folio_state *ffs;
>>>   	int ret = 0;
>>> +	bool folio_in_bio = false;
>>
>>No need to initialize folio_in_bio?

Agreed. It's redundant since we reset it to false for each new folio before processing.

>>> @@ -2539,6 +2542,11 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>>>   	}
>>>   	trace_f2fs_read_folio(folio, DATA);
>>>   	if (rac) {
>>> +		if (!folio_in_bio) {
>>> +			if (!ret)
>>> +				folio_mark_uptodate(folio);
>>> +			folio_unlock(folio);
>>> +	}
>>
>>err_out:
>>	/* Nothing was submitted. */
>>	if (!bio) {
>>		if (!ret)
>>			folio_mark_uptodate(folio);
>>		folio_unlock(folio);
>>
>>                 ^^^^^^^^^^^^
>>
>>If all folios in rac have not been mapped (hole case), will we unlock the folio twice?

Are you worried the folio could be unlocked once in the if (rac) { ... } block and then 
unlocked again at err_out:? If so, I think that won't happen.

In such a case, every non-NULL folio will be unlocked exactly once by:

if (!folio_in_bio) {
       if (!ret)
               folio_mark_uptodate(folio);
       folio_unlock(folio);
}
Specifically, after the last folio runs through the block above, the next call:

folio = readahead_folio(rac);
will return NULL. Then we go to next_folio:, and will directly hit:

if (!folio)
       goto out;
This jumps straight to the out: label, skipping err_out: entirely. 
Therefore, when ret is not an error code, the err_out: label will never be reached.

If ret becomes an error code, then the current folio will immediately goto err_out; 
and be unlocked there once.

If rac is NULL (meaning we only read the single large folio passed in as the function argument), 
we won't enter the if (rac) { ... goto next_folio; } path at all, so we also won't go to next_folio 
and then potentially goto out;. In that case, it will naturally be unlocked once at err_out:.
Or am I missing some edge case here?

Thanks,
Nanzhe

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
