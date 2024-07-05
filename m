Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC379280E6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Jul 2024 05:25:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sPZZt-0007Ez-KR;
	Fri, 05 Jul 2024 03:25:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <s_min.jeong@samsung.com>) id 1sPZZn-0007ET-A8
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Jul 2024 03:25:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c2akXWdwizOakaqRvB+3LJRxsd3egtycp0Se6+3BgO0=; b=Bva0r5DaO7qWyCVOaJ+Z/JEdhj
 nZRVnWeNo60FWfWMrylGsKmieqXOIwUnujp77RTHvS5/1821OUMH4QPiJWITnLrwJpld+Vq4S+Kp3
 vu4PMLNgRE+N4lGZrq+Ge6qVLPWsjwewoUff+LCcclKGcAoXEdefBZ5Vbp2iA6MlmhMc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID
 :Date:Subject:In-Reply-To:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c2akXWdwizOakaqRvB+3LJRxsd3egtycp0Se6+3BgO0=; b=ItCjidIyWCViTs232TC7QrNgDW
 LoRtlu8rb5Ym/VcchLtU836a33M96kl8i66b4RVnu4CqCsGQCr4tatbtA0X8Ek9xO69Z3d6zvXP/f
 S0DxOwdf9xye4PSNChgUoKVsA8kN17GtGIRYQcsXQyfenffCPyZq2HJ2Sv0yfaOqhE3A=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sPZZm-00058J-QP for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Jul 2024 03:25:35 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20240705032526epoutp0277a3dc87da7602a19a6cb56e997dd85d~fMz6c9--S3026330263epoutp02a
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  5 Jul 2024 03:25:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20240705032526epoutp0277a3dc87da7602a19a6cb56e997dd85d~fMz6c9--S3026330263epoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1720149926;
 bh=c2akXWdwizOakaqRvB+3LJRxsd3egtycp0Se6+3BgO0=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=jksFuCqtAHoHIffnyfKOJW+DZnd1BxNRiiXqWKfeyLDptZqdCsnhPhOTIrIdyh6h/
 ARNpzppaL1pEDZazm8pmHARdyElKarSVGmvmC35FcLFHY6hV4XHrIhf9p/QDQmLVmi
 57jsUQz0eEBZmAHF7MCAXv4BJYE4fY0OrufZ5y/g=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20240705032525epcas1p3e838bdd625cf176d03741edbab501e63~fMz5moEc91149111491epcas1p3e;
 Fri,  5 Jul 2024 03:25:25 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.38.241]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4WFf6F2rQRz4x9Pq; Fri,  5 Jul
 2024 03:25:25 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 C2.5C.09561.5A767866; Fri,  5 Jul 2024 12:25:25 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20240705032524epcas1p2ae7bb5095870e55148997ce06f8695c6~fMz41MwdF0215002150epcas1p2I;
 Fri,  5 Jul 2024 03:25:24 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240705032524epsmtrp23b3144e21a7fc2a20454c6ea05a70adf~fMz40jQp41750017500epsmtrp2D;
 Fri,  5 Jul 2024 03:25:24 +0000 (GMT)
X-AuditID: b6c32a39-dd5fd70000002559-ee-668767a58a48
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 B8.86.07412.4A767866; Fri,  5 Jul 2024 12:25:24 +0900 (KST)
Received: from sminjeong05 (unknown [10.253.99.183]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20240705032524epsmtip2699116c87a795532fd09e4ccdc1f3db2~fMz4oV1dW1112811128epsmtip2Q;
 Fri,  5 Jul 2024 03:25:24 +0000 (GMT)
From: "Sunmin Jeong" <s_min.jeong@samsung.com>
To: "'Chao Yu'" <chao@kernel.org>, <jaegeuk@kernel.org>
In-Reply-To: <5d8802d6-0132-4986-8238-9385d1758719@kernel.org>
Date: Fri, 5 Jul 2024 12:25:24 +0900
Message-ID: <000001dace8a$f97d2d30$ec778790$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEZTfcOKL6689m8bwnAn2Uwn8IfUQGex/DPAyyu6GKzRBicMA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGJsWRmVeSWpSXmKPExsWy7bCmge7S9PY0g8V3+S1OTz3LZDG1fS+j
 xZP1s5gtLi1yt9jy7wirxYKNjxgtZux/yu7A7rFgU6nHplWdbB67F3xm8ujbsorR4/MmuQDW
 qGybjNTElNQihdS85PyUzLx0WyXv4HjneFMzA0NdQ0sLcyWFvMTcVFslF58AXbfMHKAjlBTK
 EnNKgUIBicXFSvp2NkX5pSWpChn5xSW2SqkFKTkFZgV6xYm5xaV56Xp5qSVWhgYGRqZAhQnZ
 GS3nzrMWPFeqODXrBGMD4wnpLkZODgkBE4lvJ44zdjFycQgJ7GCUuNT3hAnC+cQo0fzvNSuE
 841R4vzmDlaYloczLkIl9jJKLPnUCtX/klFi+Z+vjCBVbAJ6EtNX/2MGsUUEzCX2LH7FBlLE
 LLCbUWLph4tgCU4BO4kd744BJTg4hAWcJZ5/kgcxWQRUJGY/NgOp4BWwlPhzegsrhC0ocXLm
 ExYQm1lAXmL72znMEAcpSPx8uowVYpWTRG/TbjaIGhGJ2Z1tzCBrJQSmckhcvv+WBaLBReLr
 mW/sELawxKvjW6BsKYnP7/ayQdjFEkfnb2CHaG5glLjx9SZUkb1Ec2sz2M3MApoS63fpQyzj
 k3j3tYcVJCwhwCvR0SYEUa0q0f1oCdSd0hLLjh2EmuIh8XfpfJYJjIqzkLw2C8lrs5C8MAth
 2QJGllWMYqkFxbnpqcWGBabw2E7Oz93ECE6gWpY7GKe//aB3iJGJg/EQowQHs5IIr9T75jQh
 3pTEyqrUovz4otKc1OJDjKbAsJ7ILCWanA9M4Xkl8YYmlgYmZkYmFsaWxmZK4rxnrpSlCgmk
 J5akZqemFqQWwfQxcXBKNTA5pO3SE745wecjW/uK24uNsgT/zs/Zz5VZvMD5LZufo2ly3rsy
 1sNqJxpe6BStyL+iqLTW1cBKcKWid28m3/6TooE7999vS05yPavDtqFph39w6gOnasHbYV84
 oz2YPkss7trAyHdp0tzbz61WrDZszL4ivK7H014j3ar/uvuaH70yd4VcpBOE/LLn5tz88erK
 cTa1X6cfPH/+RO0vbzObf7r9xiOy3MfvLysoP2tlYr7Kr1dLkutfVGNefbZfVEEt37/FGetW
 MVVe7PCe/Eg/aXawScw314rfxyrVrJjLPyzes8nbRz+067LqaQW7+E1nXiS6r+Tjrs+/pOtQ
 VBa4xO+zj9qEW/b3o5XXKLEUZyQaajEXFScCAFeIqKopBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPLMWRmVeSWpSXmKPExsWy7bCSvO6S9PY0g1kNxhanp55lspjavpfR
 4sn6WcwWlxa5W2z5d4TVYsHGR4wWM/Y/ZXdg91iwqdRj06pONo/dCz4zefRtWcXo8XmTXABr
 FJdNSmpOZllqkb5dAldGy7nzrAXPlSpOzTrB2MB4QrqLkZNDQsBE4uGMi6xdjFwcQgK7GSVm
 Xp7M3sXIAZSQljj2pwjCFJY4fLgYouQ5o8S5E6dZQHrZBPQkpq/+xwxiiwhYSiyYdY4FpIhZ
 YD+jRPeSvYwQHQcZJXoPfQPr4BSwk9jx7hgbyFRhAWeJ55/kQUwWARWJ2Y/NQCp4geb8Ob2F
 FcIWlDg58wlYJ7OAtsTTm0+hbHmJ7W/nMEPcryDx8+kyVogbnCR6m3azQdSISMzubGOewCg8
 C8moWUhGzUIyahaSlgWMLKsYJVMLinPTc5MNCwzzUsv1ihNzi0vz0vWS83M3MYLjSEtjB+O9
 +f/0DjEycTAeYpTgYFYS4ZV635wmxJuSWFmVWpQfX1Sak1p8iFGag0VJnNdwxuwUIYH0xJLU
 7NTUgtQimCwTB6dUA9OEXeIbnfRiVP9nVfXVBk89UmrNd2p94tojaWzFu4oXlbqfzb2fOO/c
 9Rlbyl4XnLp7vE/fev87o/JtwbvYSmc+1ju1rdwhYEPNBLHPvlX3jeLdHDpeWjuHtfxp6A9t
 bX2cds2fwz3Bzt9/igD3Z2n9WXGX2dp6Y1wF0rimyqndfbrvyvTHmn8uM9q1dIXpr4nheWR4
 Ye+BG4w88yb2mjY+dL55+Nqf+4Xtl/ftYvUOZNl75+HOF27nl1p++7X56emmvy2P/SZ9uPFZ
 rsBl6sWjxTwpRrw2rkfj1d6bdwpciNL5a7GU74n2lTmu1Q3hhQtCGLtNWyb8DUqffohhPfvt
 hUlKh1c80HY12KxRs1mJpTgj0VCLuag4EQBtvIKmEgMAAA==
X-CMS-MailID: 20240705032524epcas1p2ae7bb5095870e55148997ce06f8695c6
X-Msg-Generator: CA
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240702120631epcas1p1c7044f77b56009471e2dc07d4e135a99
References: <CGME20240702120631epcas1p1c7044f77b56009471e2dc07d4e135a99@epcas1p1.samsung.com>
 <20240702120624.476067-1-s_min.jeong@samsung.com>
 <5d8802d6-0132-4986-8238-9385d1758719@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao Yu, >> The page cache of the atomic file keeps new
 data pages which will be >> stored in the COW file. It can also keep old
 data pages when GCing the >> atomic file. In this case,
 new data can be overwrit [...] 
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
 [203.254.224.25 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.25 listed in sa-accredit.habeas.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sPZZm-00058J-QP
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: use meta inode for GC of atomic
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
Cc: 'Sungjong Seo' <sj1557.seo@samsung.com>, daehojeong@google.com,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao Yu,

>> The page cache of the atomic file keeps new data pages which will be
>> stored in the COW file. It can also keep old data pages when GCing the
>> atomic file. In this case, new data can be overwritten by old data if
>> a GC thread sets the old data page as dirty after new data page was
>> evicted.
>>
>> Also, since all writes to the atomic file are redirected to COW
>> inodes, GC for the atomic file is not working well as below.
>>
>> f2fs_gc(gc_type=FG_GC)
>>    - select A as a victim segment
>>    do_garbage_collect
>>      - iget atomic file's inode for block B
>>      move_data_page
>>        f2fs_do_write_data_page
>>          - use dn of cow inode
>>          - set fio->old_blkaddr from cow inode
>>      - seg_freed is 0 since block B is still valid
>>    - goto gc_more and A is selected as victim again
>>
>> To solve the problem, let's separate GC writes and updates in the
>> atomic file by using the meta inode for GC writes.
>>
>> Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
>> Cc: stable@vger.kernel.org #v5.19+
>> Reviewed-by: Sungjong Seo <sj1557.seo@samsung.com>
>> Reviewed-by: Yeongjin Gil <youngjin.gil@samsung.com>
>> Signed-off-by: Sunmin Jeong <s_min.jeong@samsung.com>
>> ---
>>   fs/f2fs/f2fs.h    | 5 +++++
>>   fs/f2fs/gc.c      | 6 +++---
>>   fs/f2fs/segment.c | 4 ++--
>>   3 files changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h index
>> a000cb024dbe..59c5117e54b1 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -4267,6 +4267,11 @@ static inline bool f2fs_post_read_required(struct
>inode *inode)
>>   		f2fs_compressed_file(inode);
>>   }
>>
>> +static inline bool f2fs_meta_inode_gc_required(struct inode *inode) {
>> +	return f2fs_post_read_required(inode) || f2fs_is_atomic_file(inode);
>> +}
>> +
>>   /*
>>    * compress.c
>>    */
>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c index
>> a079eebfb080..136b9e8180a3 100644
>> --- a/fs/f2fs/gc.c
>> +++ b/fs/f2fs/gc.c
>> @@ -1580,7 +1580,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi,
>struct f2fs_summary *sum,
>>   			start_bidx = f2fs_start_bidx_of_node(nofs, inode) +
>>   								ofs_in_node;
>>
>> -			if (f2fs_post_read_required(inode)) {
>> +			if (f2fs_meta_inode_gc_required(inode)) {
>>   				int err = ra_data_block(inode, start_bidx);
>>
>>   				f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>> @@ -1631,7 +1631,7 @@ static int gc_data_segment(struct f2fs_sb_info
>> *sbi, struct f2fs_summary *sum,
>>
>>   			start_bidx = f2fs_start_bidx_of_node(nofs, inode)
>>   								+ ofs_in_node;
>> -			if (f2fs_post_read_required(inode))
>> +			if (f2fs_meta_inode_gc_required(inode))
>>   				err = move_data_block(inode, start_bidx,
>>   							gc_type, segno, off);
>>   			else
>> @@ -1639,7 +1639,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi,
>struct f2fs_summary *sum,
>>   								segno, off);
>>
>>   			if (!err && (gc_type == FG_GC ||
>> -					f2fs_post_read_required(inode)))
>> +					f2fs_meta_inode_gc_required(inode)))
>>   				submitted++;
>>
>>   			if (locked) {
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c index
>> 7e47b8054413..b55fc4bd416a 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -3823,7 +3823,7 @@ void f2fs_wait_on_block_writeback(struct inode
>*inode, block_t blkaddr)
>>   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>>   	struct page *cpage;
>>
>> -	if (!f2fs_post_read_required(inode))
>> +	if (!f2fs_meta_inode_gc_required(inode))
>>   		return;
>>
>>   	if (!__is_valid_data_blkaddr(blkaddr))
>> @@ -3842,7 +3842,7 @@ void f2fs_wait_on_block_writeback_range(struct
>inode *inode, block_t blkaddr,
>>   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>>   	block_t i;
>>
>> -	if (!f2fs_post_read_required(inode))
>> +	if (!f2fs_meta_inode_gc_required(inode))
>>   		return;
>>
>>   	for (i = 0; i < len; i++)
>
>f2fs_write_single_data_page()
>...
>		.post_read = f2fs_post_read_required(inode) ? 1 : 0,
>
>Do we need to use f2fs_meta_inode_gc_required() here?
>
>Thanks,

As you said, we need to use f2fs_meta_inode_gc_required instead of
f2fs_post_read_required. Then what about changing the variable name
"post_read" to another one such as "meta_gc"? 
struct f2fs_io_info {
    unsigned int post_read:1;   /* require post read */

Thanks,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
