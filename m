Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE9A92CD5B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jul 2024 10:45:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sRSwa-0005YB-E7;
	Wed, 10 Jul 2024 08:44:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <s_min.jeong@samsung.com>) id 1sRSwX-0005Y2-Cb
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jul 2024 08:44:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=300J3i2LRoaSO1J17KrPlVOzydQ/v8F3HJQzxQOIX/8=; b=iDVTYrxeFyScZotNJG2gWPatRY
 eV+E9TzrqtEhr3T5mKVHBIFKoOPo5t0uN5B9W1chbCx+i2Y8uoE1nmUpILKaCLVsHV2A4uUMFDrnX
 CkWyokMyfagPfzeHLiSG5bGadkVqFZChTtZvq27glCnRBKQdRSBDHKCKyHL+H4ziRhus=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID
 :Date:Subject:In-Reply-To:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=300J3i2LRoaSO1J17KrPlVOzydQ/v8F3HJQzxQOIX/8=; b=CJw5Sx2iYUn+AHyrbNCwD7ipg9
 dgamH7zdOVZeAZbrW2YxqTf7agbyfo4sgq5Pab5KPpeTD0tBrYMkP2aw39MGkRD8gttduivOmnwU/
 uin6VL1wwRalLt0eEelfsKP83yM5JdEjkat9R7M14/kxBOZl40kWNxMZXbqTPWXm2hlo=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sRSwW-00054F-VJ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jul 2024 08:44:53 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20240710084439epoutp02631eff524769784cc657467abcfcc1e6~gzZDjF83X2029820298epoutp02j
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 10 Jul 2024 08:44:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20240710084439epoutp02631eff524769784cc657467abcfcc1e6~gzZDjF83X2029820298epoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1720601079;
 bh=300J3i2LRoaSO1J17KrPlVOzydQ/v8F3HJQzxQOIX/8=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=Gw7t0zHPbLVN6i7hHt849d6yZPsw3tnrOe585x6fyPclCp0fSyM32nDdiESDUd8y9
 y3WLHWeszPhIaDlzKmxBH9gqbsqelg9DVH+1tu1hl8qdS2JxHjnW8ohdkf+jP4oulo
 ioW/TS4n4eqp1wBTItJchcLDMpVf9TR5c7/ms8Z8=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20240710084439epcas1p2b44acf9359ddaec2e5a61031c1b5965a~gzZDOpxqa1447814478epcas1p2H;
 Wed, 10 Jul 2024 08:44:39 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.38.241]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4WJryH0c2xz4x9Px; Wed, 10 Jul
 2024 08:44:39 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 09.C6.09622.6F94E866; Wed, 10 Jul 2024 17:44:38 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20240710084438epcas1p3789e521c4b2117a1bc81476597fcf28c~gzZCiF8Pe2616826168epcas1p3b;
 Wed, 10 Jul 2024 08:44:38 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240710084438epsmtrp1d77a59f47a924cf46678bb2fb65774e2~gzZChZqET2687326873epsmtrp1E;
 Wed, 10 Jul 2024 08:44:38 +0000 (GMT)
X-AuditID: b6c32a37-e17ff70000002596-36-668e49f6d11b
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
 D6.D6.18846.6F94E866; Wed, 10 Jul 2024 17:44:38 +0900 (KST)
Received: from sminjeong05 (unknown [10.253.99.183]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20240710084438epsmtip1de2db796a522b1f952a08dc4fd22b006~gzZCS4MyS2278022780epsmtip1n;
 Wed, 10 Jul 2024 08:44:38 +0000 (GMT)
From: "Sunmin Jeong" <s_min.jeong@samsung.com>
To: "'Jaegeuk Kim'" <jaegeuk@kernel.org>
In-Reply-To: <Zo2UcW4AtAp2WTOy@google.com>
Date: Wed, 10 Jul 2024 17:44:38 +0900
Message-ID: <000001dad2a5$6601ed10$3205c730$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGzAHw+UV4cXzdqA3OLHGSK6gvL0wGgKy9PAqmsPk+yHLkNcA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGJsWRmVeSWpSXmKPExsWy7bCmru43z740g/u/rC1OTz3LZDG1fS+j
 xZP1s5gtLi1yt9jy7wirxYKNjxgtZux/yu7A7rFgU6nHplWdbB67F3xm8ujbsorR4/MmuQDW
 qGybjNTElNQihdS85PyUzLx0WyXv4HjneFMzA0NdQ0sLcyWFvMTcVFslF58AXbfMHKAjlBTK
 EnNKgUIBicXFSvp2NkX5pSWpChn5xSW2SqkFKTkFZgV6xYm5xaV56Xp5qSVWhgYGRqZAhQnZ
 GScnf2Mp+Kpf8XCzUwNjs3oXIyeHhICJxOljE1m6GLk4hAR2MEq8OzsXyvnEKLHldAcrnNOz
 6QkzTMuf4/fYIBI7GSU29q9lhHBeMkr8+3mPFaSKTUBPYvrqf2AdIgIaEndmHQErYha4wChx
 /cMeFpAEp4CWxMI999lBbGEBZ4ln2xvAmlkEVCWuv7jIBmLzClhKvO7dyQ5hC0qcnPkErJdZ
 QF5i+9s5UCcpSPx8uowVYpmTRNff+UwQNSISszvbmEEWSwhM5ZBovreQHaLBRWLVz3tQzcIS
 r45vgYpLSbzsb4OyiyWOzt/ADtHcwChx4+tNqIS9RHNrM9B1HEAbNCXW79KHWMYn8e5rDytI
 WEKAV6KjTQiiWlWi+9ESqFXSEsuOHWSHKPGQePnTYgKj4iwkn81C8tksJB/MQti1gJFlFaNY
 akFxbnpqsWGBMTy2k/NzNzGCE6iW+Q7GaW8/6B1iZOJgPMQowcGsJMI7/0Z3mhBvSmJlVWpR
 fnxRaU5q8SFGU2BYT2SWEk3OB6bwvJJ4QxNLAxMzIxMLY0tjMyVx3jNXylKFBNITS1KzU1ML
 Uotg+pg4OKUamC4y/4p7FMOcOzM7tXfxJOenNe4885y+C6ie9TjXGesxbXLlo3D+njOTg2oE
 D3SdmDd7h+xEq/WHM87tPFxuERvV+WSVcHyCwp8rWu+kD3Vf6n7rV2e+rNjuts5v9uaV/sns
 afPV9jHcmJNhZ5Gbe1Tg1Z/CGGWVYquDOwqeLFsZNeGY/v3uo4VP42KYfc22v3bJZuY91S21
 cfsWNzZGG4uHb1UWZs6Zov/bten8M0OFHadOcS55KuOTcH7H0dy1pxpq+8983xu3efKHCU/k
 bfo0n07ec5tlw7yPZ+/Wr9L9Isaqyh33z8k+yrWxUH5yrPZkiW1/Tzfa2D/24JthXfbhffu6
 XTcVXuzdoTK3a50SS3FGoqEWc1FxIgCA5IQhKQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFLMWRmVeSWpSXmKPExsWy7bCSnO43z740g68/VSxOTz3LZDG1fS+j
 xZP1s5gtLi1yt9jy7wirxYKNjxgtZux/yu7A7rFgU6nHplWdbB67F3xm8ujbsorR4/MmuQDW
 KC6blNSczLLUIn27BK6Mk5O/sRR81a94uNmpgbFZvYuRk0NCwETiz/F7bF2MXBxCAtsZJRau
 bGXqYuQASkhLHPtTBGEKSxw+XAxR8pxR4s/F6SwgvWwCehLTV/9jBrFFBDQk7sw6wghSxCxw
 hVFixtp2doiOtYwSv9v+M4JUcQpoSSzcc58dxBYWcJZ4tr2BFcRmEVCVuP7iIhuIzStgKfG6
 dyc7hC0ocXLmExaQK5iBtrVtBBvDLCAvsf3tHGaIBxQkfj5dxgpxhJNE19/5TBA1IhKzO9uY
 JzAKz0IyaRbCpFlIJs1C0rGAkWUVo2hqQXFuem5ygaFecWJucWleul5yfu4mRnD0aAXtYFy2
 /q/eIUYmDsZDjBIczEoivPNvdKcJ8aYkVlalFuXHF5XmpBYfYpTmYFES51XO6UwREkhPLEnN
 Tk0tSC2CyTJxcEo1MNXd/cKaIOOyQDJQ2LHRe49Zyv7dh84+l2f5uq5l/eUSxZKjC5ZkL3z8
 qLFqRuQmzbVWZza/1pS5qBT91OPa7eO8nZvVhbV6jQ8rt80sNlwpfcrr970HRRzlPbH+/EoR
 aVoBHyY9uvPmhoHW7iKbP/+m6JRe7ZZftjMjjeGipcembvmfm+btqV7x0v3wLuZmA6mVj0+Y
 vVZav/6dU5xM143pVr2xqzJbTytvZ/R6MkH5TfmFo59P/Fsrl7xQ3cvTSmt+2d1coUe2F3PN
 tz1NrXGSZN3pe9/ekl37s+SVmNmvI5Qlmve/OWZ5fnFX0QNvtrlqLxWeKs5M+e9alf2PrchX
 hSnx5UnmGosS+Yf/fiuxFGckGmoxFxUnAgCP9O7YDQMAAA==
X-CMS-MailID: 20240710084438epcas1p3789e521c4b2117a1bc81476597fcf28c
X-Msg-Generator: CA
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240705082511epcas1p24b7b63d5e714a25213dbe07affa52f69
References: <CGME20240705082511epcas1p24b7b63d5e714a25213dbe07affa52f69@epcas1p2.samsung.com>
 <20240705082503.805358-1-s_min.jeong@samsung.com>
 <Zo2UcW4AtAp2WTOy@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  >On 07/05, Sunmin Jeong wrote: >> In case of the COW file,
 new updates and GC writes are already >> separated to page caches of the
 atomic file and COW file. As some >> cases that use the meta inode f [...]
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [203.254.224.25 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.25 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.25 listed in bl.score.senderscore.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sRSwW-00054F-VJ
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: use meta inode for GC of COW
 file
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
Cc: daehojeong@google.com, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 'Sungjong Seo' <sj1557.seo@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

>On 07/05, Sunmin Jeong wrote:
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
>> v2:
>> - use union for cow inode to point to atomic inode
>>  fs/f2fs/data.c   |  2 +-
>>  fs/f2fs/f2fs.h   | 13 +++++++++++--
>>  fs/f2fs/file.c   |  3 +++
>>  fs/f2fs/gc.c     | 12 ++++++++++--
>>  fs/f2fs/inline.c |  2 +-
>>  fs/f2fs/inode.c  |  3 ++-
>>  6 files changed, 28 insertions(+), 7 deletions(-)
>>
>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c index
>> 9a213d03005d..f6b1782f965a 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -2606,7 +2606,7 @@ bool f2fs_should_update_outplace(struct inode
>*inode, struct f2fs_io_info *fio)
>>  		return true;
>>  	if (IS_NOQUOTA(inode))
>>  		return true;
>> -	if (f2fs_is_atomic_file(inode))
>> +	if (f2fs_used_in_atomic_write(inode))
>>  		return true;
>>  	/* rewrite low ratio compress data w/ OPU mode to avoid
>fragmentation */
>>  	if (f2fs_compressed_file(inode) &&
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h index
>> 796ae11c0fa3..4a8621e4a33a 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -843,7 +843,11 @@ struct f2fs_inode_info {
>>  	struct task_struct *atomic_write_task;	/* store atomic write task
>*/
>>  	struct extent_tree *extent_tree[NR_EXTENT_CACHES];
>>  					/* cached extent_tree entry */
>> -	struct inode *cow_inode;	/* copy-on-write inode for atomic
write
>*/
>> +	union {
>> +		struct inode *cow_inode;	/* copy-on-write inode for
atomic
>write */
>> +		struct inode *atomic_inode;
>> +					/* point to atomic_inode, available
only
>for cow_inode */
>> +	};
>>
>>  	/* avoid racing between foreground op and gc */
>>  	struct f2fs_rwsem i_gc_rwsem[2];
>> @@ -4263,9 +4267,14 @@ static inline bool f2fs_post_read_required(struct
>inode *inode)
>>  		f2fs_compressed_file(inode);
>>  }
>>
>> +static inline bool f2fs_used_in_atomic_write(struct inode *inode) {
>> +	return f2fs_is_atomic_file(inode) || f2fs_is_cow_file(inode); }
>> +
>>  static inline bool f2fs_meta_inode_gc_required(struct inode *inode)
>> {
>> -	return f2fs_post_read_required(inode) || f2fs_is_atomic_file(inode);
>> +	return f2fs_post_read_required(inode) ||
>> +f2fs_used_in_atomic_write(inode);
>>  }
>>
>>  /*
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c index
>> e4a7cff00796..547e7ec32b1f 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -2183,6 +2183,9 @@ static int f2fs_ioc_start_atomic_write(struct
>> file *filp, bool truncate)
>>
>>  		set_inode_flag(fi->cow_inode, FI_COW_FILE);
>>  		clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
>> +
>> +		/* Set the COW inode's atomic_inode to the atomic inode */
>> +		F2FS_I(fi->cow_inode)->atomic_inode = inode;
>>  	} else {
>>  		/* Reuse the already created COW inode */
>>  		ret = f2fs_do_truncate_blocks(fi->cow_inode, 0, true); diff
-
>-git
>> a/fs/f2fs/gc.c b/fs/f2fs/gc.c index cb3006551ab5..61913fcefd9e 100644
>> --- a/fs/f2fs/gc.c
>> +++ b/fs/f2fs/gc.c
>> @@ -1186,7 +1186,11 @@ static int ra_data_block(struct inode *inode,
>pgoff_t index)
>>  	};
>>  	int err;
>
>How about giving the right mapping like this?
Thanks for your opinion. I'll send the patch v3.

>
>	mapping = f2fs_is_cow_file() ?
>		F2FS_I(inode)->actomic_inode->i_mapping : inode->i_mapping;
>	page = f2fs_grab_cache_page(mapping, index, true);
>
>>
>> -	page = f2fs_grab_cache_page(mapping, index, true);
>> +	if (f2fs_is_cow_file(inode))
>> +		page = f2fs_grab_cache_page(F2FS_I(inode)->atomic_inode-
>>i_mapping,
>> +						index, true);
>> +	else
>> +		page = f2fs_grab_cache_page(mapping, index, true);
>>  	if (!page)
>>  		return -ENOMEM;
>>
>> @@ -1282,7 +1286,11 @@ static int move_data_block(struct inode *inode,
>block_t bidx,
>>  				CURSEG_ALL_DATA_ATGC : CURSEG_COLD_DATA;
>>
>>  	/* do not read out */
>
>ditto?
>
>> -	page = f2fs_grab_cache_page(inode->i_mapping, bidx, false);
>> +	if (f2fs_is_cow_file(inode))
>> +		page = f2fs_grab_cache_page(F2FS_I(inode)->atomic_inode-
>>i_mapping,
>> +						bidx, false);
>> +	else
>> +		page = f2fs_grab_cache_page(inode->i_mapping, bidx, false);
>>  	if (!page)
>>  		return -ENOMEM;
>>
>> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c index
>> 1fba5728be70..cca7d448e55c 100644
>> --- a/fs/f2fs/inline.c
>> +++ b/fs/f2fs/inline.c
>> @@ -16,7 +16,7 @@
>>
>>  static bool support_inline_data(struct inode *inode)  {
>> -	if (f2fs_is_atomic_file(inode))
>> +	if (f2fs_used_in_atomic_write(inode))
>>  		return false;
>>  	if (!S_ISREG(inode->i_mode) && !S_ISLNK(inode->i_mode))
>>  		return false;
>> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c index
>> 7a3e2458b2d9..18dea43e694b 100644
>> --- a/fs/f2fs/inode.c
>> +++ b/fs/f2fs/inode.c
>> @@ -804,8 +804,9 @@ void f2fs_evict_inode(struct inode *inode)
>>
>>  	f2fs_abort_atomic_write(inode, true);
>>
>> -	if (fi->cow_inode) {
>> +	if (fi->cow_inode && f2fs_is_cow_file(fi->cow_inode)) {
>>  		clear_inode_flag(fi->cow_inode, FI_COW_FILE);
>> +		F2FS_I(fi->cow_inode)->atomic_inode = NULL;
>>  		iput(fi->cow_inode);
>>  		fi->cow_inode = NULL;
>>  	}
>> --
>> 2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
