Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 15656A41B8C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Feb 2025 11:48:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tmW0H-0006dm-6D;
	Mon, 24 Feb 2025 10:48:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tmW0G-0006dZ-9J
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Feb 2025 10:48:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7JRRzcz5oufP1B4O7doP7SdNCyn0qn+1EbRmzVNMREs=; b=FpZRlQc6CTzO9HC589ipUkQctw
 oGCdxo60VK+FmCfUbKT5AmsNWUUi25Tz0WDQUaifAHHreOAgXeMCZLyiDoXQuQhVm0SiJ4tjSQEX4
 XCt6wjj/61i/vMM2w2cN10HVQz2xp/fc49e7ns6ZSsNyS8gWIavnBEIqgl5CssT9pFFY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7JRRzcz5oufP1B4O7doP7SdNCyn0qn+1EbRmzVNMREs=; b=kbYbc/GbkoO7lh4tLpz+hDvigN
 hHGzxTP9BJ/WBakfEyyv/Ezvbr3yZoRsf0Pcxgp14skIP4iKC/XmqAut4CpJxAKNRv3qBnng1BZwW
 YB2lBRJISqPM/VKTzntinwnpcG9aTBq/D8d961gJAES5oqkYpFTeryuUESqHbb50DUFk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tmW0G-0004Nx-6u for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Feb 2025 10:48:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CA4716119F;
 Mon, 24 Feb 2025 10:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13206C4CED6;
 Mon, 24 Feb 2025 10:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740394069;
 bh=eIgCdJjAMkjDXoM50NjKZgQTAKFkDD604iLENVAOjYE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=SZCUq+nNl6X+bObN5eHBPS/GzC6UxloKEe63PssWGq4NB7Ukk2dmG9EiJANEesWjk
 Czhj8zApGt7pxbqeKI8FukywLRseKOfuiR5h8Ys1JkLsrKHjtxoxE7lNRRBUM9Tn1g
 nrZXjIzuDnKwurQKqFAsyRgspw6jmVzL24pzk8YbfpsIUx3KAc9hNuKx6yw8vGEVj2
 s4kV72YnNaL/fDlIB+GzzKOQX1di3XkuzRQx8WngsnVUTuBnBoOXKtRKXf+ZTFq967
 RmCTN/VVaJPyoa0bRep7wHKZaA3HGWcSiZcJjhfM1WdZk0xCG88wmHuv1apYlfl6de
 IQQ898wARlWAA==
Message-ID: <5f390129-1b93-42d2-8db7-276c370db90f@kernel.org>
Date: Mon, 24 Feb 2025 18:47:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250212072742.977248-1-chao@kernel.org>
 <Z6zQoyNp5td-Wgd1@google.com>
 <d8be79a2-9470-45b7-9df1-b571f2219c30@kernel.org>
 <Z64uA2ys4nhV54lI@google.com>
 <666e62d1-3446-485e-bac9-0cc8089b04de@kernel.org>
Content-Language: en-US
In-Reply-To: <666e62d1-3446-485e-bac9-0cc8089b04de@kernel.org>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2/14/25 09:44, Chao Yu wrote: > On 2/14/25 01:38, Jaegeuk
 Kim wrote: >> On 02/13, Chao Yu wrote: >>> On 2/13/25 00:47, Jaegeuk Kim
 wrote: >>>> On 02/12, Chao Yu wrote: >>>>> From: Leo Stone <leocst [...] 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tmW0G-0004Nx-6u
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: add check for deleted inode
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: syzbot+b01a36acd7007e273a83@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, Leo Stone <leocstone@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2/14/25 09:44, Chao Yu wrote:
> On 2/14/25 01:38, Jaegeuk Kim wrote:
>> On 02/13, Chao Yu wrote:
>>> On 2/13/25 00:47, Jaegeuk Kim wrote:
>>>> On 02/12, Chao Yu wrote:
>>>>> From: Leo Stone <leocstone@gmail.com>
>>>>>
>>>>> The syzbot reproducer mounts a f2fs image, then tries to unlink an
>>>>> existing file. However, the unlinked file already has a link count of 0
>>>>> when it is read for the first time in do_read_inode().
>>>>>
>>>>> Add a check to sanity_check_inode() for i_nlink == 0.
>>>>>
>>>>> [Chao Yu: rebase the code and fix orphan inode recovery issue]
>>>>> Reported-by: syzbot+b01a36acd7007e273a83@syzkaller.appspotmail.com
>>>>> Closes: https://syzkaller.appspot.com/bug?extid=b01a36acd7007e273a83
>>>>> Fixes: 39a53e0ce0df ("f2fs: add superblock and major in-memory structure")
>>>>> Signed-off-by: Leo Stone <leocstone@gmail.com>
>>>>> Signed-off-by: Chao Yu <chao@kernel.org>
>>>>> ---
>>>>>  fs/f2fs/checkpoint.c | 4 ++++
>>>>>  fs/f2fs/f2fs.h       | 1 +
>>>>>  fs/f2fs/inode.c      | 6 ++++++
>>>>>  3 files changed, 11 insertions(+)
>>>>>
>>>>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
>>>>> index bd890738b94d..ada2c548645c 100644
>>>>> --- a/fs/f2fs/checkpoint.c
>>>>> +++ b/fs/f2fs/checkpoint.c
>>>>> @@ -751,6 +751,8 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi)
>>>>>  	if (is_sbi_flag_set(sbi, SBI_IS_WRITABLE))
>>>>>  		f2fs_info(sbi, "orphan cleanup on readonly fs");
>>>>>  
>>>>> +	set_sbi_flag(sbi, SBI_ORPHAN_RECOVERY);
>>>>
>>>> What about using SBI_POR_DOING?
>>>
>>> SBI_POR_DOING will cover most flow of f2fs_fill_super(), I think we can add a
>>> separated flag just covering f2fs_recover_orphan_inodes(), so that we can allow
>>> iget() of root_inode and all inodes during roll-forward recovery to do sanity
>>> check nlink w/ zero. What do you think?
>>
>> Can we do this sanity check after f2fs_iget in the f2fs_unlink() only?
> 
> Sure, we need to cover f2fs_rename() as well, please check this:
> 
> https://lore.kernel.org/all/67450f9a.050a0220.21d33d.0003.GAE@google.com

Hi Jaegeuk,

I'm testing this, seems there is a problem, once we opened an inode that
has zeroed nlink, in f2fs_evict_inode(), the inode and all its data will be
deleted, then leaving its stale dir entry in parent directory.

What do you think using v4? so that we may has chance to repair it w/ fsck
rather than just deleting it?

---
 fs/f2fs/namei.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index a278c7da8177..949621bc0d07 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -547,6 +547,16 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 		goto fail;
 	}

+	if (unlikely(S_ISDIR(inode->i_mode) ?
+			inode->i_nlink <= 1 : inode->i_nlink == 0)) {
+		f2fs_err_ratelimited(sbi, "%s: inode (ino=%lx) has inconsistent nlink: %u, isdir: %d",
+				__func__, inode->i_ino, inode->i_nlink,
+				S_ISDIR(inode->i_mode));
+		err = -EFSCORRUPTED;
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		goto fail;
+	}
+
 	err = f2fs_dquot_initialize(dir);
 	if (err)
 		goto fail;
@@ -968,6 +978,15 @@ static int f2fs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 	}

 	if (new_inode) {
+		if (unlikely(old_is_dir ?
+			new_inode->i_nlink <= 1 : new_inode->i_nlink == 0)) {
+			f2fs_err_ratelimited(sbi, "%s: inode (ino=%lx) has inconsistent nlink: %u, isdir: %d",
+				__func__, new_inode->i_ino, new_inode->i_nlink,
+				S_ISDIR(new_inode->i_mode));
+			err = -EFSCORRUPTED;
+			set_sbi_flag(sbi, SBI_NEED_FSCK);
+			goto out_dir;
+		}

 		err = -ENOTEMPTY;
 		if (old_is_dir && !f2fs_empty_dir(new_inode))
-- 
2.48.1.601.g30ceb7b040-goog

> 
> Thanks,
> 
>>
>>>
>>> Thanks,
>>>
>>>>
>>>>> +
>>>>>  	start_blk = __start_cp_addr(sbi) + 1 + __cp_payload(sbi);
>>>>>  	orphan_blocks = __start_sum_addr(sbi) - 1 - __cp_payload(sbi);
>>>>>  
>>>>> @@ -778,9 +780,11 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi)
>>>>>  		}
>>>>>  		f2fs_put_page(page, 1);
>>>>>  	}
>>>>> +
>>>>>  	/* clear Orphan Flag */
>>>>>  	clear_ckpt_flags(sbi, CP_ORPHAN_PRESENT_FLAG);
>>>>>  out:
>>>>> +	clear_sbi_flag(sbi, SBI_ORPHAN_RECOVERY);
>>>>>  	set_sbi_flag(sbi, SBI_IS_RECOVERED);
>>>>>  
>>>>>  	return err;
>>>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>>>> index 05879c6dc4d6..1c75081c0c14 100644
>>>>> --- a/fs/f2fs/f2fs.h
>>>>> +++ b/fs/f2fs/f2fs.h
>>>>> @@ -1322,6 +1322,7 @@ enum {
>>>>>  	SBI_IS_CLOSE,				/* specify unmounting */
>>>>>  	SBI_NEED_FSCK,				/* need fsck.f2fs to fix */
>>>>>  	SBI_POR_DOING,				/* recovery is doing or not */
>>>>> +	SBI_ORPHAN_RECOVERY,			/* orphan inodes recovery is doing */
>>>>>  	SBI_NEED_SB_WRITE,			/* need to recover superblock */
>>>>>  	SBI_NEED_CP,				/* need to checkpoint */
>>>>>  	SBI_IS_SHUTDOWN,			/* shutdown by ioctl */
>>>>> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
>>>>> index d6ad7810df69..02f1b69d03d8 100644
>>>>> --- a/fs/f2fs/inode.c
>>>>> +++ b/fs/f2fs/inode.c
>>>>> @@ -386,6 +386,12 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
>>>>>  		}
>>>>>  	}
>>>>>  
>>>>> +	if (inode->i_nlink == 0 && !is_sbi_flag_set(sbi, SBI_ORPHAN_RECOVERY)) {
>>>>> +		f2fs_warn(sbi, "%s: inode (ino=%lx) has a link count of 0",
>>>>> +			  __func__, inode->i_ino);
>>>>> +		return false;
>>>>> +	}
>>>>> +
>>>>>  	return true;
>>>>>  }
>>>>>  
>>>>> -- 
>>>>> 2.48.1.502.g6dc24dfdaf-goog
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
