Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 694FB3DCAFC
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  1 Aug 2021 11:59:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mA8Ft-00062A-Gq; Sun, 01 Aug 2021 09:59:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mA8Fs-000624-Cb
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 Aug 2021 09:59:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ouvRLAj5H21HLTHcR40oz1zEd81frkew9IIARted4Yk=; b=cbFtIJ7AL+ohYLzRP8MC26dQI5
 tOfkerxXMLzJ9isOAlYxNCdJqetIr8LIKHsB68wNabgum9MdV4qcjxsqQEAsI01Bzqm+kutbAj6ak
 pXuxTG3HqGN4L9vA9S8KQMp3moNbdU6nrJOeoGw5LhBqDEmiUOh001oJ/CkHDLWw3TlU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ouvRLAj5H21HLTHcR40oz1zEd81frkew9IIARted4Yk=; b=Z0gLcGyTga2B+BucZZSiAxblmU
 4k2VeznGht7zLHAVg9hI0wYPJodnihP5r5en/41Gzby/HiHVNc6S8iJGD/auKqPdUQQ0CXgrPL25w
 Na5auSBJWcVmHjSatNGF1fFGsAR8LjhjvXOGAT8n6NdHvGWqnUFWa3pa7oF4zOkTOlsA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mA8Fl-009HUa-CJ
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 Aug 2021 09:59:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2BB4A610A0;
 Sun,  1 Aug 2021 09:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627811964;
 bh=bhp36r6obC2nEqhj0ex5uPhGv2lmRu4DIPjP5sNYcU4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=VusSK5uPj1qQADT0NSKF3MYzdWiB0iyhG83Xt7Z+qNBVUe5pw6IfG1mEZNOtxiHJK
 Koy+P3ZLTORCedQlOK5p3oHDVVQU4qnwAl3ak2TekEEaaMjgQ9OFht8qV0WQ3Okg73
 TOVptpTN+yrFIY3EkJ4HsKhLfhErOqi+ba4Z05emBpxWaQ/bGo3D9jT3g7yh7WkO8o
 HOs4ndcQ//asBPSG443pF3Pc/qQbHX6oYJYKC8wmWUIqzUCbo1lWVPZrzV1kS/+4Ck
 3yj4KOcTwi/bYeTbQhB4sMJH+Hf8iH7CRbr/+QyotuzII78aB0lBvY2DmsowSxuO+i
 2ELCskaXwt8aQ==
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210427082106.2755-1-frank.li@vivo.com>
 <12ae52df-bc5e-82c3-4f78-1eafe7723f93@huawei.com>
 <5f37995c-2390-e8ca-d002-3639ad39e0d3@kernel.org>
 <YPXDtEyBg5W2ToD/@google.com>
 <8d2e3a63-72f9-bcb2-24e5-dddd84136001@kernel.org>
 <YQR60QUh0Pim8vSf@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <355ac2ff-f1f1-b9ea-bd8c-139cb24a03fb@kernel.org>
Date: Sun, 1 Aug 2021 17:59:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQR60QUh0Pim8vSf@google.com>
Content-Language: en-US
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mA8Fl-009HUa-CJ
Subject: Re: [f2fs-dev] [PATCH] f2fs: reset free segment to prefree status
 when do_checkpoint() fail
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/7/31 6:18, Jaegeuk Kim wrote:
> On 07/20, Chao Yu wrote:
>> On 2021/7/20 2:25, Jaegeuk Kim wrote:
>>> On 07/19, Chao Yu wrote:
>>>> On 2021/4/27 20:37, Chao Yu wrote:
>>>>> I think just reverting dirty/free bitmap is not enough if checkpoint fails,
>>>>> due to we have updated sbi->cur_cp_pack and nat/sit bitmap, next CP tries
>>>>> to overwrite last valid meta/node/data, then filesystem will be corrupted.
>>>>>
>>>>> So I suggest to set cp_error if do_checkpoint() fails until we can handle
>>>>> all cases, which is not so easy.
>>>>>
>>>>> How do you think?
>>>>
>>>> Let's add below patch first before you figure out the patch which covers all
>>>> things.
>>>>
>>>>   From 3af957c98e9e04259f8bb93ca0b74ba164f3f27e Mon Sep 17 00:00:00 2001
>>>> From: Chao Yu <chao@kernel.org>
>>>> Date: Mon, 19 Jul 2021 16:37:44 +0800
>>>> Subject: [PATCH] f2fs: fix to stop filesystem update once CP failed
>>>>
>>>> During f2fs_write_checkpoint(), once we failed in
>>>> f2fs_flush_nat_entries() or do_checkpoint(), metadata of filesystem
>>>> such as prefree bitmap, nat/sit version bitmap won't be recovered,
>>>> it may cause f2fs image to be inconsistent, let's just set CP error
>>>> flag to avoid further updates until we figure out a scheme to rollback
>>>> all metadatas in such condition.
>>>>
>>>> Reported-by: Yangtao Li <frank.li@vivo.com>
>>>> Signed-off-by: Yangtao Li <frank.li@vivo.com>
>>>> Signed-off-by: Chao Yu <chao@kernel.org>
>>>> ---
>>>>    fs/f2fs/checkpoint.c | 10 +++++++---
>>>>    1 file changed, 7 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
>>>> index 6c208108d69c..096c85022f62 100644
>>>> --- a/fs/f2fs/checkpoint.c
>>>> +++ b/fs/f2fs/checkpoint.c
>>>> @@ -1639,8 +1639,10 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>>>>
>>>>    	/* write cached NAT/SIT entries to NAT/SIT area */
>>>>    	err = f2fs_flush_nat_entries(sbi, cpc);
>>>> -	if (err)
>>>> +	if (err) {
>>>> +		f2fs_stop_checkpoint(sbi, false);
>>>
>>> I think we should abuse this, since we can get any known ENOMEM as well.
>>
>> Yup, but one critical issue here is it can break A/B update of NAT area,
>> so, in order to fix this hole, how about using NOFAIL memory allocation
>> in f2fs_flush_nat_entries() first until we figure out the finial scheme?
> 
> NOFAIL is risky, so how about adding a retry logic on ENOMEM with a message
> and then giving up if we can't get the memory? BTW, what about EIO or other
> family?

How about this?

 From ffb50d9a8220be7d9e159b8555533adcf11957a8 Mon Sep 17 00:00:00 2001
From: Chao Yu <chao@kernel.org>
Date: Mon, 19 Jul 2021 16:37:44 +0800
Subject: [PATCH v2] f2fs: fix to stop filesystem update once CP failed

During f2fs_write_checkpoint(), once we failed in
f2fs_flush_nat_entries() or do_checkpoint(), metadata of filesystem
such as prefree bitmap, nat/sit version bitmap won't be recovered,
it may cause f2fs image to be inconsistent, let's just set CP error
flag to avoid further updates until we figure out a scheme to rollback
all metadatas in such condition.

Reported-by: Yangtao Li <frank.li@vivo.com>
Signed-off-by: Yangtao Li <frank.li@vivo.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
  fs/f2fs/checkpoint.c | 12 +++++++++---
  fs/f2fs/node.c       |  9 ++++++++-
  2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 6c208108d69c..f3f66871ae42 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1639,8 +1639,11 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)

  	/* write cached NAT/SIT entries to NAT/SIT area */
  	err = f2fs_flush_nat_entries(sbi, cpc);
-	if (err)
+	if (err) {
+		f2fs_err(sbi, "f2fs_flush_nat_entries failed err:%d, stop checkpoint", err);
+		f2fs_stop_checkpoint(sbi, false);
  		goto stop;
+	}

  	f2fs_flush_sit_entries(sbi, cpc);

@@ -1648,10 +1651,13 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
  	f2fs_save_inmem_curseg(sbi);

  	err = do_checkpoint(sbi, cpc);
-	if (err)
+	if (err) {
+		f2fs_err(sbi, "do_checkpoint failed err:%d, stop checkpoint", err);
+		f2fs_stop_checkpoint(sbi, false);
  		f2fs_release_discard_addrs(sbi);
-	else
+	} else {
  		f2fs_clear_prefree_segments(sbi, cpc);
+	}

  	f2fs_restore_inmem_curseg(sbi);
  stop:
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 5840b82ce311..7162836d71c1 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -141,13 +141,20 @@ static struct page *get_next_nat_page(struct f2fs_sb_info *sbi, nid_t nid)
  	void *src_addr;
  	void *dst_addr;
  	struct f2fs_nm_info *nm_i = NM_I(sbi);
+	bool retried = false;

  	dst_off = next_nat_addr(sbi, current_nat_addr(sbi, nid));

+retry:
  	/* get current nat block page with lock */
  	src_page = get_current_nat_page(sbi, nid);
-	if (IS_ERR(src_page))
+	if (IS_ERR(src_page)) {
+		if (PTR_ERR(src_page) == -ENOMEM && !retried) {
+			retried = true;
+			goto retry;
+		}
  		return src_page;
+	}
  	dst_page = f2fs_grab_meta_page(sbi, dst_off);
  	f2fs_bug_on(sbi, PageDirty(src_page));

-- 
2.22.1




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
