Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FC743A99B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Oct 2021 03:09:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mfAyO-000739-Mz; Tue, 26 Oct 2021 01:09:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mfAyM-000731-VF
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Oct 2021 01:09:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sK6E54NU8cd1mcMn81RsuXdjahsqN5CTxuOmE8xfNzI=; b=aNseVnrZhQGCR+TGo8Mfe4qFQr
 zpyyfajJstThfFluDBx7uYA6w0GYPejbTgvZMP5cZbVUDp0xlHl0xIQJrGkTuV2jZbgD4TXQhf8XT
 +pEsT98J+IHEgjd7tY6xbgu1SHj8R6K7r664zIYl1G73EE2e1hb2Qa8G2/i9jLd7CM4w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sK6E54NU8cd1mcMn81RsuXdjahsqN5CTxuOmE8xfNzI=; b=JWJ63R+A95knQob3UTVRE+xJhg
 kgQZblt/fVEP8gpt8bXURJg2mJh8qqAw5WzbOeoYrujvqGwVOkX70EGBobtEsKLga/pPwJlzltA38
 /d1P3ZJYoVNASTyaSwJ9ZItp86EPlmsLH56sDdbuuHlJzV6T2KcIFZ0xBC9SuCZcjcVI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mfAyE-00078k-Qs
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Oct 2021 01:09:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F8AB60F02;
 Tue, 26 Oct 2021 01:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635210577;
 bh=9IShqJt6djvjPUKPObtm68+6DHvwPd46YWHkaPWwxPU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DKhWB2ZLMvh4VvXNoIzw3Nasi5QXYIle57ZQGP7SXLJMC9rMhhnIGUkYjUAteIwwC
 yaocx7eqAQoB9qepVh6S687VAGEF7iRusH2xzdw5iHrL0tQamQsep9Tn3YzxpcT1er
 CWqTtj/jhCcpM2izuV4e2YGnL2IxICf0AEoDUqVEet8IhZqT2AW7GvNtBbFg0hZrVc
 vhocZOatFjgNBOIidlWIWhjfy4VA7IIrEIM0fpCLrFAm5IcPXCmY70rbnqees0pfH/
 U/NWZf6pnhD12uH8ENGjIWxFADzJGWFgS+n2NDQJYDgaBV52yWIsbkoU17/BDfz6Un
 fmq4cM66pLmWA==
Message-ID: <c93106ef-b567-b973-7241-ea2fcef84855@kernel.org>
Date: Tue, 26 Oct 2021 09:09:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>
References: <20211014190503.717830-1-daeho43@gmail.com>
 <e8b106fb-2878-2fa9-788f-965eef179a85@kernel.org>
 <CACOAw_yupuz+Xx-z9V0UaExuARHd8H9rruWCa2yj5-mgkeuUtQ@mail.gmail.com>
 <3ddb4013-8d63-7c00-6fdd-1f21752bd60c@kernel.org>
 <CACOAw_wjhr8j=-qEDHP_H+_7cTh_ep7Wix4=JC+5x5zp-zpUFA@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CACOAw_wjhr8j=-qEDHP_H+_7cTh_ep7Wix4=JC+5x5zp-zpUFA@mail.gmail.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/10/26 0:22, Daeho Jeong wrote: > On Fri, Oct 22, 2021
 at 8:32 AM Chao Yu <chao@kernel.org> wrote: >> >> On 2021/10/22 0:44, Daeho
 Jeong wrote: >>> There is a deadlock between sb_internal lock [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mfAyE-00078k-Qs
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove circular locking between
 sb_internal and fs_reclaim
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/10/26 0:22, Daeho Jeong wrote:
> On Fri, Oct 22, 2021 at 8:32 AM Chao Yu <chao@kernel.org> wrote:
>>
>> On 2021/10/22 0:44, Daeho Jeong wrote:
>>> There is a deadlock between sb_internal lock (sb_start_intwrite()) and
>>> dquot related lock.
>>> It's because we call f2fs_truncate(), which eventually calls
>>> dquot_initialize(), while holding sb_internal lock.
>>> So, I called dquot_initialize() in advance to make the 2nd calling of
>>> it in f2fs_truncate() ineffective.
>>> This is similar with the thing in f2fs_evict_inode() in inode.c
>>
>> Well, if dquot_initialize() fails in f2fs_drop_inode(), will we still run
>> into deadlock?
>>
> 
> Do you think the same issue is in f2fs_evict_inode() in inode.c?

Yes, I doubt the problem may also happen in f2fs_evict_inode() with below
callpath:

- evict_inode
  - dquot_initialize failed
  - sb_start_intwrite
  - f2fs_truncate
   - dquot_initialize lock dqio_sem

How about this?

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
old mode 100644
new mode 100755
index b24b9bc..0e49593
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -728,6 +728,7 @@ enum {
      FI_ENABLE_COMPRESS,    /* enable compression in "user" compression mode */
      FI_COMPRESS_RELEASED,    /* compressed blocks were released */
      FI_ALIGNED_WRITE,    /* enable aligned write */
+    FI_QUOTA_INIT_FAIL,    /* inidicate failed to initialize quota in drop_inode()/evict_inode() */
      FI_MAX,            /* max flag, never be used */
  };

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
old mode 100644
new mode 100755
index 13deae0..2fb53f54
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -789,9 +789,11 @@ int f2fs_truncate(struct inode *inode)
          return -EIO;
      }

-    err = dquot_initialize(inode);
-    if (err)
-        return err;
+    if (!is_inode_flag_set(inode, FI_QUOTA_INIT_FAIL)) {
+        err = dquot_initialize(inode);
+        if (err)
+            return err;
+    }

      /* we should check inline_data size */
      if (!f2fs_may_inline_data(inode)) {
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
old mode 100644
new mode 100755
index 1213f15..16cf50c
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -758,6 +758,7 @@ void f2fs_evict_inode(struct inode *inode)
      if (err) {
          err = 0;
          set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
+        set_inode_flag(inode, FI_QUOTA_INIT_FAIL);
      }

      f2fs_remove_ino_entry(sbi, inode->i_ino, APPEND_INO);
@@ -770,6 +771,8 @@ void f2fs_evict_inode(struct inode *inode)
  retry:
      if (F2FS_HAS_BLOCKS(inode))
          err = f2fs_truncate(inode);
+    if (is_inode_flag_set(inode, FI_QUOTA_INIT_FAIL))
+        clear_inode_flag(inode, FI_QUOTA_INIT_FAIL);

      if (time_to_inject(sbi, FAULT_EVICT_INODE)) {
          f2fs_show_injection_info(sbi, FAULT_EVICT_INODE);

Thanks,


> In fact, I picked up the idea from here.
> 
>          err = dquot_initialize(inode);
>          if (err) {
>                  err = 0;
>                  set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
>          }
> 
>          f2fs_remove_ino_entry(sbi, inode->i_ino, APPEND_INO);
>          f2fs_remove_ino_entry(sbi, inode->i_ino, UPDATE_INO);
>          f2fs_remove_ino_entry(sbi, inode->i_ino, FLUSH_INO);
> 
>          sb_start_intwrite(inode->i_sb);
>          set_inode_flag(inode, FI_NO_ALLOC);
>          i_size_write(inode, 0);
> retry:
>          if (F2FS_HAS_BLOCKS(inode))
>                  err = f2fs_truncate(inode);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
