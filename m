Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 290479280F5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Jul 2024 05:32:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sPZge-0005M6-Hu;
	Fri, 05 Jul 2024 03:32:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <s_min.jeong@samsung.com>) id 1sPZgb-0005Ly-Dj
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Jul 2024 03:32:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SZiJcGYwUZyOTmrQpRwRYRoFQsL/v8kBc9kYuoSESQQ=; b=NXvLLPteUeerfJwSoDwjupLxei
 AHIDtJKfQUh6QvIx4MuZbKNGpI9gKfm7F+g5RcpgVYoQiIw8xh+2yjJIaDmHd8VaaMKUT9TxQI17s
 QOegDt25Te13DKBd0VydQJoPg3FVuzazovT3lzRkjVIZR1YSzpyNmOY8Vz+g4aVsCEBs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID
 :Date:Subject:In-Reply-To:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SZiJcGYwUZyOTmrQpRwRYRoFQsL/v8kBc9kYuoSESQQ=; b=RAUSrz5SXB7+nI4J4j4qg21+xf
 RCNq35qUmZeeQu0lsb1xPNCxDpQQSjlmBStoUF6n4v3sheXLJUtAQ97KtmhlGmnyAdYLXN4prqYg5
 TFwCZtKsv0V6bYeeTR7+yoiPfaSNPz0lv/SvGN93+eKH8RAnejLbUOk5OMpZDYVd4pGI=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sPZgZ-0005Q7-9v for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Jul 2024 03:32:35 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20240705033222epoutp04ee27400c9b7217906fe90e08d2679a36~fM5_FkD0P1189811898epoutp04Y
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  5 Jul 2024 03:32:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20240705033222epoutp04ee27400c9b7217906fe90e08d2679a36~fM5_FkD0P1189811898epoutp04Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1720150342;
 bh=SZiJcGYwUZyOTmrQpRwRYRoFQsL/v8kBc9kYuoSESQQ=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=mp+ngmNU4UG31nMLWsqzbgnPhhLlHYy5clq3CUgxnvQCtYnqGSJdNyfxms6cz19fb
 7BWk1d6yNUdFAQPUmg4jv1qEr5qknbzpZ5YE4SOph6jA1W9s/eXpZj3OWBUuRkVc4k
 zdRwTMW7wgBhFiZDlxxp/YNmPEjfpks1biw1kOgU=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20240705033222epcas1p4b058691e00e0af258c7e0dac93ba2082~fM59uCj9u0519205192epcas1p4I;
 Fri,  5 Jul 2024 03:32:22 +0000 (GMT)
Received: from epsmgec1p1-new.samsung.com (unknown [182.195.36.222]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4WFfGG0W0dz4x9Pv; Fri,  5 Jul
 2024 03:32:22 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmgec1p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
 EB.17.19059.54967866; Fri,  5 Jul 2024 12:32:21 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20240705033221epcas1p31a4e921e1b88552ed9a1e5e73f4e62f3~fM58-7ug20881208812epcas1p3u;
 Fri,  5 Jul 2024 03:32:21 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240705033221epsmtrp1fb821c51dca468be5035bbbcf57a0358~fM58-Ih2D1970019700epsmtrp1O;
 Fri,  5 Jul 2024 03:32:21 +0000 (GMT)
X-AuditID: b6c32a4c-483cda8000004a73-ee-668769450f3a
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 40.FF.19057.54967866; Fri,  5 Jul 2024 12:32:21 +0900 (KST)
Received: from sminjeong05 (unknown [10.253.99.183]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20240705033221epsmtip12558625f9788bfca645c199dfffb8149~fM58unZwh3084030840epsmtip1b;
 Fri,  5 Jul 2024 03:32:21 +0000 (GMT)
From: "Sunmin Jeong" <s_min.jeong@samsung.com>
To: "'Chao Yu'" <chao@kernel.org>, <jaegeuk@kernel.org>
In-Reply-To: <c9d66cc2-5990-450f-9ede-be8244c607a9@kernel.org>
Date: Fri, 5 Jul 2024 12:32:21 +0900
Message-ID: <009d01dace8b$f1e00f60$d5a02e20$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHpYWANuXk0M7ogIk9j0lI/V59FzgGopQB4AZ+SpgyxsBJC0A==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFJsWRmVeSWpSXmKPExsWy7bCmga5rZnuawYRua4vTU88yWUxt38to
 8WT9LGaLS4vcLbb8O8JqsWDjI0aLGfufsjuweyzYVOqxaVUnm8fuBZ+ZPPq2rGL0+LxJLoA1
 KtsmIzUxJbVIITUvOT8lMy/dVsk7ON453tTMwFDX0NLCXEkhLzE31VbJxSdA1y0zB+gIJYWy
 xJxSoFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpBSk6BWYFecWJucWleul5eaomVoYGBkSlQYUJ2
 xpy7d9kLFmhX3Fy/ka2B8Y9SFyMnh4SAicSuhvUsXYxcHEICexgl7q3YC+V8YpRYtvowE4Tz
 jVFi4cVLbDAtL6cvZwaxhQT2MkpMvuQOUfSSUeLd9eksIAk2AT2J6av/gRWJCJhL7Fn8ig2k
 iFlgN6PE0g8XwRKcAnYSP+Y+ZQexhQUcJFb0f2ACsVkEVCQae2cADeLg4BWwlNj5UA4kzCsg
 KHFy5hOw+cwC8hLb385hhjhIQeLn02WsELucJJY0roWqEZGY3dnGDLJXQmAqh8TX79+gGlwk
 zhy/xQphC0u8Or6FHcKWknjZ3wZlF0scnb+BHaK5gVHixtebUAl7iebWZjaQ45gFNCXW79KH
 WMYn8e5rDytIWEKAV6KjTQiiWlWi+9ESqLXSEsuOHYSa4iHx7vNJpgmMirOQvDYLyWuzkLww
 C2HZAkaWVYxSqQXFuempyYYFhrp5qeXwGE/Oz93ECE6kWj47GL+v/6t3iJGJg/EQowQHs5II
 r9T75jQh3pTEyqrUovz4otKc1OJDjKbA8J7ILCWanA9M5Xkl8YYmlgYmZkYmFsaWxmZK4rxn
 rpSlCgmkJ5akZqemFqQWwfQxcXBKNTCpcx6/Vz7PLfLXM5euK6V7X6zvyZ+7dr5i4J2N++Yk
 fZz9ZLXntiOFKeaHnXIWJvJHdVyP9WjofxppO+Ng2duINcv7ShddWaxrEnewmpv9KYeRfO1a
 gz+u81+Y1rU1z1+9/M3bZfO3muqUbro53aN+zuIJN9/aWRzYKmmYxnJqsRPTWt4V9qrnZh2r
 eZzTV6O5IZ/xUdLXV+trNW59nplxZ/LM3lkJM1/r7g7aM3OXcxLLWdFFXJce6oixMK+5/FMy
 +duHPwF3Nv0O/lbVu/e+fsRmth9hco3/zmbufq3J86g0Z9H1VuVv745yH/15P7fAqKaR4xk7
 axjX3e1lerdDnBxP3zNbevpj34QDFuaRukosxRmJhlrMRcWJAL7ZMdstBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgkeLIzCtJLcpLzFFi42LZdlhJTtc1sz3NoKlLyeL01LNMFlPb9zJa
 PFk/i9ni0iJ3iy3/jrBaLNj4iNFixv6n7A7sHgs2lXpsWtXJ5rF7wWcmj74tqxg9Pm+SC2CN
 4rJJSc3JLEst0rdL4MqYc/cue8EC7Yqb6zeyNTD+Uepi5OSQEDCReDl9OXMXIxeHkMBuRomX
 Z6ewdzFyACWkJY79KYIwhSUOHy6GKHnOKPH2yyQ2kF42AT2J6av/MYPYIgKWEgtmnWMBKWIW
 2M8o0b1kLyNEx0FGiUvdF1lBqjgF7CR+zH3KDmILCzhIrOj/wARiswioSDT2zmAB2cYLNGnn
 QzmQMK+AoMTJmU9YQGxmAW2JpzefQtnyEtvfzmGGeEBB4ufTZawQRzhJLGlcC1UjIjG7s415
 AqPwLCSjZiEZNQvJqFlIWhYwsqxilEwtKM5Nzy02LDDKSy3XK07MLS7NS9dLzs/dxAiOJC2t
 HYx7Vn3QO8TIxMF4iFGCg1lJhFfqfXOaEG9KYmVValF+fFFpTmrxIUZpDhYlcd5vr3tThATS
 E0tSs1NTC1KLYLJMHJxSDUyikTdebHZ4JZXfFNtkti/xz3q26ZqTLefcd5sqtuJo3Y3L/W80
 s9e6lS5gujG5+bCw3IKceVxBURfy5uvOEisQ5LriMD2dUcowc1PQqTkSE9rnLq7N7YjXWdRW
 2JQWpaNSJKn69OKaqCULJT4wev+pn2nfoX1LMd6t/Hu0mHujIUP1xynL3rj2rwn+d2q1f5Nh
 9fNmgR93ql9FCNedu3ZoGsd9u+W/zG15GGY2dzhsqp11TeWgxJwcg4vFygx2ciKMsxv0Fwvn
 eP+Rf5LlE1TrKttwt+elevtxcQ4ZVq1TE3qmyu697mxelVa0Nu1/+qJPx60rnRf4GYTnJmgy
 tj/5Eu8iVvdVUji6ysBbiaU4I9FQi7moOBEA7ge8pBMDAAA=
X-CMS-MailID: 20240705033221epcas1p31a4e921e1b88552ed9a1e5e73f4e62f3
X-Msg-Generator: CA
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240702120643epcas1p4b98b4bfef3b3ef72cf50737697b67eeb
References: <CGME20240702120643epcas1p4b98b4bfef3b3ef72cf50737697b67eeb@epcas1p4.samsung.com>
 <20240702120636.476119-1-s_min.jeong@samsung.com>
 <c9d66cc2-5990-450f-9ede-be8244c607a9@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao Yu, >> In case of the COW file, new updates and GC
 writes are already >> separated to page caches of the atomic file and COW
 file. As some >> cases that use the meta inode for GC, there are some race
 issu [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.34 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sPZgZ-0005Q7-9v
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: use meta inode for GC of COW file
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
Cc: 'Sungjong Seo' <sj1557.seo@samsung.com>, daehojeong@google.com,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao Yu,

>> In case of the COW file, new updates and GC writes are already
>> separated to page caches of the atomic file and COW file. As some
>> cases that use the meta inode for GC, there are some race issues
>> between a foreground thread and GC thread.
>>
>> To handle them, we need to take care when to invalidate and wait
>> writeback of GC pages in COW files as the case of using the meta inode.
>> Also, a pointer from the COW inode to the original inode is required
>> to check the state of original pages.
>>
>> For the former, we can solve the problem by using the meta inode for
>> GC of COW files. Then let's get a page from the original inode in
>> move_data_block when GCing the COW file to avoid race condition.
>>
>> Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
>> Cc: stable@vger.kernel.org #v5.19+
>> Reviewed-by: Sungjong Seo <sj1557.seo@samsung.com>
>> Reviewed-by: Yeongjin Gil <youngjin.gil@samsung.com>
>> Signed-off-by: Sunmin Jeong <s_min.jeong@samsung.com>
>> ---
>>   fs/f2fs/data.c   |  2 +-
>>   fs/f2fs/f2fs.h   |  7 ++++++-
>>   fs/f2fs/file.c   |  3 +++
>>   fs/f2fs/gc.c     | 12 ++++++++++--
>>   fs/f2fs/inline.c |  2 +-
>>   fs/f2fs/inode.c  |  3 ++-
>>   6 files changed, 23 insertions(+), 6 deletions(-)
>>
>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c index
>> 05158f89ef32..90ff0f6f7f7f 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -2651,7 +2651,7 @@ bool f2fs_should_update_outplace(struct inode
>*inode, struct f2fs_io_info *fio)
>>   		return true;
>>   	if (IS_NOQUOTA(inode))
>>   		return true;
>> -	if (f2fs_is_atomic_file(inode))
>> +	if (f2fs_used_in_atomic_write(inode))
>>   		return true;
>>   	/* rewrite low ratio compress data w/ OPU mode to avoid
>fragmentation */
>>   	if (f2fs_compressed_file(inode) &&
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h index
>> 59c5117e54b1..4f9fd1c1d024 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -4267,9 +4267,14 @@ static inline bool f2fs_post_read_required(struct
>inode *inode)
>>   		f2fs_compressed_file(inode);
>>   }
>>
>> +static inline bool f2fs_used_in_atomic_write(struct inode *inode) {
>> +	return f2fs_is_atomic_file(inode) || f2fs_is_cow_file(inode); }
>> +
>>   static inline bool f2fs_meta_inode_gc_required(struct inode *inode)
>>   {
>> -	return f2fs_post_read_required(inode) || f2fs_is_atomic_file(inode);
>> +	return f2fs_post_read_required(inode) ||
>> +f2fs_used_in_atomic_write(inode);
>>   }
>>
>>   /*
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c index
>> 25b119cf3499..c9f0ba658cfd 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -2116,6 +2116,9 @@ static int f2fs_ioc_start_atomic_write(struct
>> file *filp, bool truncate)
>>
>>   		set_inode_flag(fi->cow_inode, FI_COW_FILE);
>>   		clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
>> +
>> +		/* Set the COW inode's cow_inode to the atomic inode */
>> +		F2FS_I(fi->cow_inode)->cow_inode = inode;
>
>How about adding a union fields as below for readability?
>
>struct f2fs_inode_info {
>...
>	union {
>		struct inode *cow_inode;	/* copy-on-write inode for atomic
>write */
>		struct inode *atomic_inode;	/* point to atomic_inode,
>available only for cow_inode */
>	};
>...
>};
>
>Thanks,
>

Thanks for you opinion. I'll send patch v2.

>>   	} else {
>>   		/* Reuse the already created COW inode */
>>   		ret = f2fs_do_truncate_blocks(fi->cow_inode, 0, true); diff -
>-git
>> a/fs/f2fs/gc.c b/fs/f2fs/gc.c index 136b9e8180a3..76854e732b35 100644
>> --- a/fs/f2fs/gc.c
>> +++ b/fs/f2fs/gc.c
>> @@ -1188,7 +1188,11 @@ static int ra_data_block(struct inode *inode,
>pgoff_t index)
>>   	};
>>   	int err;
>>
>> -	page = f2fs_grab_cache_page(mapping, index, true);
>> +	if (f2fs_is_cow_file(inode))
>> +		page = f2fs_grab_cache_page(F2FS_I(inode)->cow_inode-
>>i_mapping,
>> +						index, true);
>> +	else
>> +		page = f2fs_grab_cache_page(mapping, index, true);
>>   	if (!page)
>>   		return -ENOMEM;
>>
>> @@ -1287,7 +1291,11 @@ static int move_data_block(struct inode *inode,
>block_t bidx,
>>   				CURSEG_ALL_DATA_ATGC : CURSEG_COLD_DATA;
>>
>>   	/* do not read out */
>> -	page = f2fs_grab_cache_page(inode->i_mapping, bidx, false);
>> +	if (f2fs_is_cow_file(inode))
>> +		page = f2fs_grab_cache_page(F2FS_I(inode)->cow_inode-
>>i_mapping,
>> +						bidx, false);
>> +	else
>> +		page = f2fs_grab_cache_page(inode->i_mapping, bidx, false);
>>   	if (!page)
>>   		return -ENOMEM;
>>
>> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c index
>> ac00423f117b..0186ec049db6 100644
>> --- a/fs/f2fs/inline.c
>> +++ b/fs/f2fs/inline.c
>> @@ -16,7 +16,7 @@
>>
>>   static bool support_inline_data(struct inode *inode)
>>   {
>> -	if (f2fs_is_atomic_file(inode))
>> +	if (f2fs_used_in_atomic_write(inode))
>>   		return false;
>>   	if (!S_ISREG(inode->i_mode) && !S_ISLNK(inode->i_mode))
>>   		return false;
>> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c index
>> c26effdce9aa..c810304e2681 100644
>> --- a/fs/f2fs/inode.c
>> +++ b/fs/f2fs/inode.c
>> @@ -807,8 +807,9 @@ void f2fs_evict_inode(struct inode *inode)
>>
>>   	f2fs_abort_atomic_write(inode, true);
>>
>> -	if (fi->cow_inode) {
>> +	if (fi->cow_inode && f2fs_is_cow_file(fi->cow_inode)) {
>>   		clear_inode_flag(fi->cow_inode, FI_COW_FILE);
>> +		F2FS_I(fi->cow_inode)->cow_inode = NULL;
>>   		iput(fi->cow_inode);
>>   		fi->cow_inode = NULL;
>>   	}



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
