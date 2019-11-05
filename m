Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 889F2EF34F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Nov 2019 03:18:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iRoPt-0006gW-AD; Tue, 05 Nov 2019 02:17:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iRoPr-0006fc-Tg
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 02:17:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qCJC1KoScIYuEE945B8fF8Zg6FqVYJxfjhVcDrKW2VY=; b=RwoYn+6HoklvCsEPhVK5Al6ZHq
 Jai0KaEwGhMS95aLKqkcP572w+vqnm/s9NMRkH982HQEMTNEDg2aXFhV+J+j+asAe4D5uosNy5iPO
 FA9MG0PSriuv+y9KIAd78t7YDg5/RCYyQkUFNy5ackD1TEfovCN/OytjtRcF1uHy4QQQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qCJC1KoScIYuEE945B8fF8Zg6FqVYJxfjhVcDrKW2VY=; b=cR4dJSOvGJvFd4mNUIU5yxPO4y
 HBQBMZD3NwYS8YnSDVk7A2KBn5e6nI6SVEgoyUruyjoGp2ytLY4tPi3VXXZwNNYQ9r0KAAnKcrU9F
 G+93mwAsKXuvdLLmZk4I6iNTP4vqTnyBeR8qvtQ9bk7SlAZ5medkr+nAP0sI1wgaX+Uk=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iRoPo-000Iri-UJ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 02:17:55 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id A0FF5ABEA00A7A751289;
 Tue,  5 Nov 2019 10:17:45 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 5 Nov 2019
 10:17:42 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20191101095324.9902-1-yuchao0@huawei.com>
 <20191101095324.9902-3-yuchao0@huawei.com>
 <20191105000249.GA46956@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <40d0df3f-cc55-d31a-474b-76f57d96bd89@huawei.com>
Date: Tue, 5 Nov 2019 10:17:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191105000249.GA46956@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: folded.name]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iRoPo-000Iri-UJ
Subject: Re: [f2fs-dev] [PATCH 3/3] Revert "f2fs: use kvmalloc,
 if kmalloc is failed"
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/11/5 8:02, Jaegeuk Kim wrote:
> On 11/01, Chao Yu wrote:
>> This reverts commit 5222595d093ebe80329d38d255d14316257afb3e.
>>
>> As discussed with Eric, as kvmalloc() will try kmalloc() first, so
>> when we need allocate large size memory, it'd better to use
>> f2fs_kvmalloc() directly rather than adding additional fallback
>> logic to call kvmalloc() after we failed in f2fs_kmalloc().
>>
>> In order to avoid allocation failure described in original commit,
>> I change to use f2fs_kvmalloc() for .free_nid_bitmap bitmap memory.
> 
> Is there any problem in the previous flow?

No existing problem, however, it's redundant to introduce fallback flow in
f2fs_kmalloc() like vmalloc() did, since we can call f2fs_vmalloc() directly in
places where we need large memory.

Thanks,

> 
>>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>  fs/f2fs/acl.c        |  6 ++---
>>  fs/f2fs/checkpoint.c |  2 +-
>>  fs/f2fs/data.c       |  2 +-
>>  fs/f2fs/debug.c      |  2 +-
>>  fs/f2fs/dir.c        |  6 ++---
>>  fs/f2fs/f2fs.h       | 10 ++-----
>>  fs/f2fs/file.c       |  2 +-
>>  fs/f2fs/gc.c         |  4 +--
>>  fs/f2fs/hash.c       |  4 +--
>>  fs/f2fs/inline.c     |  4 +--
>>  fs/f2fs/namei.c      |  2 +-
>>  fs/f2fs/node.c       | 10 +++----
>>  fs/f2fs/segment.c    | 28 +++++++++----------
>>  fs/f2fs/super.c      | 64 ++++++++++++++++++++++----------------------
>>  fs/f2fs/xattr.c      | 10 +++----
>>  15 files changed, 75 insertions(+), 81 deletions(-)
>>
>> diff --git a/fs/f2fs/acl.c b/fs/f2fs/acl.c
>> index 217b290ae3a5..306413589827 100644
>> --- a/fs/f2fs/acl.c
>> +++ b/fs/f2fs/acl.c
>> @@ -160,7 +160,7 @@ static void *f2fs_acl_to_disk(struct f2fs_sb_info *sbi,
>>  	return (void *)f2fs_acl;
>>  
>>  fail:
>> -	kvfree(f2fs_acl);
>> +	kfree(f2fs_acl);
>>  	return ERR_PTR(-EINVAL);
>>  }
>>  
>> @@ -190,7 +190,7 @@ static struct posix_acl *__f2fs_get_acl(struct inode *inode, int type,
>>  		acl = NULL;
>>  	else
>>  		acl = ERR_PTR(retval);
>> -	kvfree(value);
>> +	kfree(value);
>>  
>>  	return acl;
>>  }
>> @@ -240,7 +240,7 @@ static int __f2fs_set_acl(struct inode *inode, int type,
>>  
>>  	error = f2fs_setxattr(inode, name_index, "", value, size, ipage, 0);
>>  
>> -	kvfree(value);
>> +	kfree(value);
>>  	if (!error)
>>  		set_cached_acl(inode, type, acl);
>>  
>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
>> index ffdaba0c55d2..b33779822a2c 100644
>> --- a/fs/f2fs/checkpoint.c
>> +++ b/fs/f2fs/checkpoint.c
>> @@ -965,7 +965,7 @@ int f2fs_get_valid_checkpoint(struct f2fs_sb_info *sbi)
>>  	f2fs_put_page(cp1, 1);
>>  	f2fs_put_page(cp2, 1);
>>  fail_no_cp:
>> -	kvfree(sbi->ckpt);
>> +	kfree(sbi->ckpt);
>>  	return err;
>>  }
>>  
>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>> index 0bcb28d70894..58f4bade6c2b 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -2889,7 +2889,7 @@ static void f2fs_dio_end_io(struct bio *bio)
>>  	bio->bi_private = dio->orig_private;
>>  	bio->bi_end_io = dio->orig_end_io;
>>  
>> -	kvfree(dio);
>> +	kfree(dio);
>>  
>>  	bio_endio(bio);
>>  }
>> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
>> index 9b0bedd82581..5abd1d67d8b2 100644
>> --- a/fs/f2fs/debug.c
>> +++ b/fs/f2fs/debug.c
>> @@ -515,7 +515,7 @@ void f2fs_destroy_stats(struct f2fs_sb_info *sbi)
>>  	list_del(&si->stat_list);
>>  	mutex_unlock(&f2fs_stat_mutex);
>>  
>> -	kvfree(si);
>> +	kfree(si);
>>  }
>>  
>>  void __init f2fs_create_root_stats(void)
>> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
>> index c967cacf979e..83ca3b721015 100644
>> --- a/fs/f2fs/dir.c
>> +++ b/fs/f2fs/dir.c
>> @@ -158,7 +158,7 @@ static void f2fs_fname_setup_ci_filename(struct inode *dir,
>>  					iname, cf_name->name,
>>  					F2FS_NAME_LEN);
>>  	if ((int)cf_name->len <= 0) {
>> -		kvfree(cf_name->name);
>> +		kfree(cf_name->name);
>>  		cf_name->name = NULL;
>>  	}
>>  }
>> @@ -245,7 +245,7 @@ struct f2fs_dir_entry *f2fs_find_target_dentry(struct fscrypt_name *fname,
>>  		*max_slots = max_len;
>>  
>>  #ifdef CONFIG_UNICODE
>> -	kvfree(cf_str.name);
>> +	kfree(cf_str.name);
>>  #endif
>>  	return de;
>>  }
>> @@ -1101,7 +1101,7 @@ static int f2fs_d_hash(const struct dentry *dentry, struct qstr *str)
>>  	}
>>  	str->hash = full_name_hash(dentry, norm, len);
>>  out:
>> -	kvfree(norm);
>> +	kfree(norm);
>>  	return ret;
>>  }
>>  
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 3f6204202788..8833e9d32f9d 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -1677,7 +1677,7 @@ static inline void disable_nat_bits(struct f2fs_sb_info *sbi, bool lock)
>>  	if (lock)
>>  		spin_unlock_irqrestore(&sbi->cp_lock, flags);
>>  
>> -	kvfree(nat_bits);
>> +	kfree(nat_bits);
>>  }
>>  
>>  static inline bool enabled_nat_bits(struct f2fs_sb_info *sbi,
>> @@ -2798,18 +2798,12 @@ static inline bool f2fs_may_extent_tree(struct inode *inode)
>>  static inline void *f2fs_kmalloc(struct f2fs_sb_info *sbi,
>>  					size_t size, gfp_t flags)
>>  {
>> -	void *ret;
>> -
>>  	if (time_to_inject(sbi, FAULT_KMALLOC)) {
>>  		f2fs_show_injection_info(sbi, FAULT_KMALLOC);
>>  		return NULL;
>>  	}
>>  
>> -	ret = kmalloc(size, flags);
>> -	if (ret)
>> -		return ret;
>> -
>> -	return kvmalloc(size, flags);
>> +	return kmalloc(size, flags);
>>  }
>>  
>>  static inline void *f2fs_kzalloc(struct f2fs_sb_info *sbi,
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index e5ce697c0544..a7d855efc294 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -3220,7 +3220,7 @@ static int f2fs_get_volume_name(struct file *filp, unsigned long arg)
>>  				min(FSLABEL_MAX, count)))
>>  		err = -EFAULT;
>>  
>> -	kvfree(vbuf);
>> +	kfree(vbuf);
>>  	return err;
>>  }
>>  
>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>> index 24a3b6b52210..80b8da471286 100644
>> --- a/fs/f2fs/gc.c
>> +++ b/fs/f2fs/gc.c
>> @@ -142,7 +142,7 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
>>  			"f2fs_gc-%u:%u", MAJOR(dev), MINOR(dev));
>>  	if (IS_ERR(gc_th->f2fs_gc_task)) {
>>  		err = PTR_ERR(gc_th->f2fs_gc_task);
>> -		kvfree(gc_th);
>> +		kfree(gc_th);
>>  		sbi->gc_thread = NULL;
>>  	}
>>  out:
>> @@ -155,7 +155,7 @@ void f2fs_stop_gc_thread(struct f2fs_sb_info *sbi)
>>  	if (!gc_th)
>>  		return;
>>  	kthread_stop(gc_th->f2fs_gc_task);
>> -	kvfree(gc_th);
>> +	kfree(gc_th);
>>  	sbi->gc_thread = NULL;
>>  }
>>  
>> diff --git a/fs/f2fs/hash.c b/fs/f2fs/hash.c
>> index 5bc4dcd8fc03..7d1cc0e3d72c 100644
>> --- a/fs/f2fs/hash.c
>> +++ b/fs/f2fs/hash.c
>> @@ -124,14 +124,14 @@ f2fs_hash_t f2fs_dentry_hash(const struct inode *dir,
>>  
>>  	dlen = utf8_casefold(um, name_info, buff, PATH_MAX);
>>  	if (dlen < 0) {
>> -		kvfree(buff);
>> +		kfree(buff);
>>  		goto opaque_seq;
>>  	}
>>  	folded.name = buff;
>>  	folded.len = dlen;
>>  	r = __f2fs_dentry_hash(&folded, fname);
>>  
>> -	kvfree(buff);
>> +	kfree(buff);
>>  	return r;
>>  
>>  opaque_seq:
>> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
>> index 896db0416f0e..b132568b751d 100644
>> --- a/fs/f2fs/inline.c
>> +++ b/fs/f2fs/inline.c
>> @@ -515,7 +515,7 @@ static int f2fs_move_rehashed_dirents(struct inode *dir, struct page *ipage,
>>  			!f2fs_has_inline_xattr(dir))
>>  		F2FS_I(dir)->i_inline_xattr_size = 0;
>>  
>> -	kvfree(backup_dentry);
>> +	kfree(backup_dentry);
>>  	return 0;
>>  recover:
>>  	lock_page(ipage);
>> @@ -526,7 +526,7 @@ static int f2fs_move_rehashed_dirents(struct inode *dir, struct page *ipage,
>>  	set_page_dirty(ipage);
>>  	f2fs_put_page(ipage, 1);
>>  
>> -	kvfree(backup_dentry);
>> +	kfree(backup_dentry);
>>  	return err;
>>  }
>>  
>> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
>> index 4faf06e8bf89..d8ca896e109b 100644
>> --- a/fs/f2fs/namei.c
>> +++ b/fs/f2fs/namei.c
>> @@ -655,7 +655,7 @@ static int f2fs_symlink(struct inode *dir, struct dentry *dentry,
>>  	f2fs_handle_failed_inode(inode);
>>  out_free_encrypted_link:
>>  	if (disk_link.name != (unsigned char *)symname)
>> -		kvfree(disk_link.name);
>> +		kfree(disk_link.name);
>>  	return err;
>>  }
>>  
>> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
>> index 6912faba811e..261798b9a9f7 100644
>> --- a/fs/f2fs/node.c
>> +++ b/fs/f2fs/node.c
>> @@ -3065,7 +3065,7 @@ static int init_free_nid_cache(struct f2fs_sb_info *sbi)
>>  	int i;
>>  
>>  	nm_i->free_nid_bitmap =
>> -		f2fs_kzalloc(sbi, array_size(sizeof(unsigned char *),
>> +		f2fs_kvzalloc(sbi, array_size(sizeof(unsigned char *),
>>  					     nm_i->nat_blocks),
>>  			     GFP_KERNEL);
>>  	if (!nm_i->free_nid_bitmap)
>> @@ -3183,13 +3183,13 @@ void f2fs_destroy_node_manager(struct f2fs_sb_info *sbi)
>>  	}
>>  	kvfree(nm_i->free_nid_count);
>>  
>> -	kvfree(nm_i->nat_bitmap);
>> -	kvfree(nm_i->nat_bits);
>> +	kfree(nm_i->nat_bitmap);
>> +	kfree(nm_i->nat_bits);
>>  #ifdef CONFIG_F2FS_CHECK_FS
>> -	kvfree(nm_i->nat_bitmap_mir);
>> +	kfree(nm_i->nat_bitmap_mir);
>>  #endif
>>  	sbi->nm_info = NULL;
>> -	kvfree(nm_i);
>> +	kfree(nm_i);
>>  }
>>  
>>  int __init f2fs_create_node_manager_caches(void)
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index c525d8c87ddf..8c96d6008e20 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -718,7 +718,7 @@ int f2fs_create_flush_cmd_control(struct f2fs_sb_info *sbi)
>>  				"f2fs_flush-%u:%u", MAJOR(dev), MINOR(dev));
>>  	if (IS_ERR(fcc->f2fs_issue_flush)) {
>>  		err = PTR_ERR(fcc->f2fs_issue_flush);
>> -		kvfree(fcc);
>> +		kfree(fcc);
>>  		SM_I(sbi)->fcc_info = NULL;
>>  		return err;
>>  	}
>> @@ -737,7 +737,7 @@ void f2fs_destroy_flush_cmd_control(struct f2fs_sb_info *sbi, bool free)
>>  		kthread_stop(flush_thread);
>>  	}
>>  	if (free) {
>> -		kvfree(fcc);
>> +		kfree(fcc);
>>  		SM_I(sbi)->fcc_info = NULL;
>>  	}
>>  }
>> @@ -2059,7 +2059,7 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
>>  				"f2fs_discard-%u:%u", MAJOR(dev), MINOR(dev));
>>  	if (IS_ERR(dcc->f2fs_issue_discard)) {
>>  		err = PTR_ERR(dcc->f2fs_issue_discard);
>> -		kvfree(dcc);
>> +		kfree(dcc);
>>  		SM_I(sbi)->dcc_info = NULL;
>>  		return err;
>>  	}
>> @@ -2083,7 +2083,7 @@ static void destroy_discard_cmd_control(struct f2fs_sb_info *sbi)
>>  	if (unlikely(atomic_read(&dcc->discard_cmd_cnt)))
>>  		f2fs_issue_discard_timeout(sbi);
>>  
>> -	kvfree(dcc);
>> +	kfree(dcc);
>>  	SM_I(sbi)->dcc_info = NULL;
>>  }
>>  
>> @@ -4488,7 +4488,7 @@ static void destroy_dirty_segmap(struct f2fs_sb_info *sbi)
>>  
>>  	destroy_victim_secmap(sbi);
>>  	SM_I(sbi)->dirty_info = NULL;
>> -	kvfree(dirty_i);
>> +	kfree(dirty_i);
>>  }
>>  
>>  static void destroy_curseg(struct f2fs_sb_info *sbi)
>> @@ -4500,10 +4500,10 @@ static void destroy_curseg(struct f2fs_sb_info *sbi)
>>  		return;
>>  	SM_I(sbi)->curseg_array = NULL;
>>  	for (i = 0; i < NR_CURSEG_TYPE; i++) {
>> -		kvfree(array[i].sum_blk);
>> -		kvfree(array[i].journal);
>> +		kfree(array[i].sum_blk);
>> +		kfree(array[i].journal);
>>  	}
>> -	kvfree(array);
>> +	kfree(array);
>>  }
>>  
>>  static void destroy_free_segmap(struct f2fs_sb_info *sbi)
>> @@ -4514,7 +4514,7 @@ static void destroy_free_segmap(struct f2fs_sb_info *sbi)
>>  	SM_I(sbi)->free_info = NULL;
>>  	kvfree(free_i->free_segmap);
>>  	kvfree(free_i->free_secmap);
>> -	kvfree(free_i);
>> +	kfree(free_i);
>>  }
>>  
>>  static void destroy_sit_info(struct f2fs_sb_info *sbi)
>> @@ -4526,19 +4526,19 @@ static void destroy_sit_info(struct f2fs_sb_info *sbi)
>>  
>>  	if (sit_i->sentries)
>>  		kvfree(sit_i->bitmap);
>> -	kvfree(sit_i->tmp_map);
>> +	kfree(sit_i->tmp_map);
>>  
>>  	kvfree(sit_i->sentries);
>>  	kvfree(sit_i->sec_entries);
>>  	kvfree(sit_i->dirty_sentries_bitmap);
>>  
>>  	SM_I(sbi)->sit_info = NULL;
>> -	kvfree(sit_i->sit_bitmap);
>> +	kfree(sit_i->sit_bitmap);
>>  #ifdef CONFIG_F2FS_CHECK_FS
>> -	kvfree(sit_i->sit_bitmap_mir);
>> +	kfree(sit_i->sit_bitmap_mir);
>>  	kvfree(sit_i->invalid_segmap);
>>  #endif
>> -	kvfree(sit_i);
>> +	kfree(sit_i);
>>  }
>>  
>>  void f2fs_destroy_segment_manager(struct f2fs_sb_info *sbi)
>> @@ -4554,7 +4554,7 @@ void f2fs_destroy_segment_manager(struct f2fs_sb_info *sbi)
>>  	destroy_free_segmap(sbi);
>>  	destroy_sit_info(sbi);
>>  	sbi->sm_info = NULL;
>> -	kvfree(sm_info);
>> +	kfree(sm_info);
>>  }
>>  
>>  int __init f2fs_create_segment_manager_caches(void)
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index c02a47ce551b..b72d071aedd8 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -324,7 +324,7 @@ static int f2fs_set_qf_name(struct super_block *sb, int qtype,
>>  	set_opt(sbi, QUOTA);
>>  	return 0;
>>  errout:
>> -	kvfree(qname);
>> +	kfree(qname);
>>  	return ret;
>>  }
>>  
>> @@ -336,7 +336,7 @@ static int f2fs_clear_qf_name(struct super_block *sb, int qtype)
>>  		f2fs_err(sbi, "Cannot change journaled quota options when quota turned on");
>>  		return -EINVAL;
>>  	}
>> -	kvfree(F2FS_OPTION(sbi).s_qf_names[qtype]);
>> +	kfree(F2FS_OPTION(sbi).s_qf_names[qtype]);
>>  	F2FS_OPTION(sbi).s_qf_names[qtype] = NULL;
>>  	return 0;
>>  }
>> @@ -429,10 +429,10 @@ static int parse_options(struct super_block *sb, char *options)
>>  				set_opt(sbi, BG_GC);
>>  				set_opt(sbi, FORCE_FG_GC);
>>  			} else {
>> -				kvfree(name);
>> +				kfree(name);
>>  				return -EINVAL;
>>  			}
>> -			kvfree(name);
>> +			kfree(name);
>>  			break;
>>  		case Opt_disable_roll_forward:
>>  			set_opt(sbi, DISABLE_ROLL_FORWARD);
>> @@ -590,7 +590,7 @@ static int parse_options(struct super_block *sb, char *options)
>>  					!strncmp(name, "adaptive", 8)) {
>>  				if (f2fs_sb_has_blkzoned(sbi)) {
>>  					f2fs_warn(sbi, "adaptive mode is not allowed with zoned block device feature");
>> -					kvfree(name);
>> +					kfree(name);
>>  					return -EINVAL;
>>  				}
>>  				set_opt_mode(sbi, F2FS_MOUNT_ADAPTIVE);
>> @@ -598,10 +598,10 @@ static int parse_options(struct super_block *sb, char *options)
>>  					!strncmp(name, "lfs", 3)) {
>>  				set_opt_mode(sbi, F2FS_MOUNT_LFS);
>>  			} else {
>> -				kvfree(name);
>> +				kfree(name);
>>  				return -EINVAL;
>>  			}
>> -			kvfree(name);
>> +			kfree(name);
>>  			break;
>>  		case Opt_io_size_bits:
>>  			if (args->from && match_int(args, &arg))
>> @@ -730,10 +730,10 @@ static int parse_options(struct super_block *sb, char *options)
>>  					!strncmp(name, "fs-based", 8)) {
>>  				F2FS_OPTION(sbi).whint_mode = WHINT_MODE_FS;
>>  			} else {
>> -				kvfree(name);
>> +				kfree(name);
>>  				return -EINVAL;
>>  			}
>> -			kvfree(name);
>> +			kfree(name);
>>  			break;
>>  		case Opt_alloc:
>>  			name = match_strdup(&args[0]);
>> @@ -747,10 +747,10 @@ static int parse_options(struct super_block *sb, char *options)
>>  					!strncmp(name, "reuse", 5)) {
>>  				F2FS_OPTION(sbi).alloc_mode = ALLOC_MODE_REUSE;
>>  			} else {
>> -				kvfree(name);
>> +				kfree(name);
>>  				return -EINVAL;
>>  			}
>> -			kvfree(name);
>> +			kfree(name);
>>  			break;
>>  		case Opt_fsync:
>>  			name = match_strdup(&args[0]);
>> @@ -767,10 +767,10 @@ static int parse_options(struct super_block *sb, char *options)
>>  				F2FS_OPTION(sbi).fsync_mode =
>>  							FSYNC_MODE_NOBARRIER;
>>  			} else {
>> -				kvfree(name);
>> +				kfree(name);
>>  				return -EINVAL;
>>  			}
>> -			kvfree(name);
>> +			kfree(name);
>>  			break;
>>  		case Opt_test_dummy_encryption:
>>  #ifdef CONFIG_FS_ENCRYPTION
>> @@ -1052,10 +1052,10 @@ static void destroy_device_list(struct f2fs_sb_info *sbi)
>>  	for (i = 0; i < sbi->s_ndevs; i++) {
>>  		blkdev_put(FDEV(i).bdev, FMODE_EXCL);
>>  #ifdef CONFIG_BLK_DEV_ZONED
>> -		kvfree(FDEV(i).blkz_seq);
>> +		kfree(FDEV(i).blkz_type);
>>  #endif
>>  	}
>> -	kvfree(sbi->devs);
>> +	kfree(sbi->devs);
>>  }
>>  
>>  static void f2fs_put_super(struct super_block *sb)
>> @@ -1125,28 +1125,28 @@ static void f2fs_put_super(struct super_block *sb)
>>  	f2fs_destroy_node_manager(sbi);
>>  	f2fs_destroy_segment_manager(sbi);
>>  
>> -	kvfree(sbi->ckpt);
>> +	kfree(sbi->ckpt);
>>  
>>  	f2fs_unregister_sysfs(sbi);
>>  
>>  	sb->s_fs_info = NULL;
>>  	if (sbi->s_chksum_driver)
>>  		crypto_free_shash(sbi->s_chksum_driver);
>> -	kvfree(sbi->raw_super);
>> +	kfree(sbi->raw_super);
>>  
>>  	destroy_device_list(sbi);
>>  	mempool_destroy(sbi->write_io_dummy);
>>  #ifdef CONFIG_QUOTA
>>  	for (i = 0; i < MAXQUOTAS; i++)
>> -		kvfree(F2FS_OPTION(sbi).s_qf_names[i]);
>> +		kfree(F2FS_OPTION(sbi).s_qf_names[i]);
>>  #endif
>>  	destroy_percpu_info(sbi);
>>  	for (i = 0; i < NR_PAGE_TYPE; i++)
>> -		kvfree(sbi->write_io[i]);
>> +		kfree(sbi->write_io[i]);
>>  #ifdef CONFIG_UNICODE
>>  	utf8_unload(sbi->s_encoding);
>>  #endif
>> -	kvfree(sbi);
>> +	kfree(sbi);
>>  }
>>  
>>  int f2fs_sync_fs(struct super_block *sb, int sync)
>> @@ -1600,7 +1600,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>>  				GFP_KERNEL);
>>  			if (!org_mount_opt.s_qf_names[i]) {
>>  				for (j = 0; j < i; j++)
>> -					kvfree(org_mount_opt.s_qf_names[j]);
>> +					kfree(org_mount_opt.s_qf_names[j]);
>>  				return -ENOMEM;
>>  			}
>>  		} else {
>> @@ -1724,7 +1724,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>>  #ifdef CONFIG_QUOTA
>>  	/* Release old quota file names */
>>  	for (i = 0; i < MAXQUOTAS; i++)
>> -		kvfree(org_mount_opt.s_qf_names[i]);
>> +		kfree(org_mount_opt.s_qf_names[i]);
>>  #endif
>>  	/* Update the POSIXACL Flag */
>>  	sb->s_flags = (sb->s_flags & ~SB_POSIXACL) |
>> @@ -1744,7 +1744,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>>  #ifdef CONFIG_QUOTA
>>  	F2FS_OPTION(sbi).s_jquota_fmt = org_mount_opt.s_jquota_fmt;
>>  	for (i = 0; i < MAXQUOTAS; i++) {
>> -		kvfree(F2FS_OPTION(sbi).s_qf_names[i]);
>> +		kfree(F2FS_OPTION(sbi).s_qf_names[i]);
>>  		F2FS_OPTION(sbi).s_qf_names[i] = org_mount_opt.s_qf_names[i];
>>  	}
>>  #endif
>> @@ -2935,7 +2935,7 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
>>  		}
>>  	}
>>  
>> -	kvfree(zones);
>> +	kfree(zones);
>>  
>>  	return err;
>>  }
>> @@ -2992,7 +2992,7 @@ static int read_raw_super_block(struct f2fs_sb_info *sbi,
>>  
>>  	/* No valid superblock */
>>  	if (!*raw_super)
>> -		kvfree(super);
>> +		kfree(super);
>>  	else
>>  		err = 0;
>>  
>> @@ -3563,7 +3563,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>>  		if (err)
>>  			goto sync_free_meta;
>>  	}
>> -	kvfree(options);
>> +	kfree(options);
>>  
>>  	/* recover broken superblock */
>>  	if (recovery) {
>> @@ -3620,7 +3620,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>>  	f2fs_destroy_segment_manager(sbi);
>>  free_devices:
>>  	destroy_device_list(sbi);
>> -	kvfree(sbi->ckpt);
>> +	kfree(sbi->ckpt);
>>  free_meta_inode:
>>  	make_bad_inode(sbi->meta_inode);
>>  	iput(sbi->meta_inode);
>> @@ -3631,7 +3631,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>>  	destroy_percpu_info(sbi);
>>  free_bio_info:
>>  	for (i = 0; i < NR_PAGE_TYPE; i++)
>> -		kvfree(sbi->write_io[i]);
>> +		kfree(sbi->write_io[i]);
>>  
>>  #ifdef CONFIG_UNICODE
>>  	utf8_unload(sbi->s_encoding);
>> @@ -3639,15 +3639,15 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>>  free_options:
>>  #ifdef CONFIG_QUOTA
>>  	for (i = 0; i < MAXQUOTAS; i++)
>> -		kvfree(F2FS_OPTION(sbi).s_qf_names[i]);
>> +		kfree(F2FS_OPTION(sbi).s_qf_names[i]);
>>  #endif
>> -	kvfree(options);
>> +	kfree(options);
>>  free_sb_buf:
>> -	kvfree(raw_super);
>> +	kfree(raw_super);
>>  free_sbi:
>>  	if (sbi->s_chksum_driver)
>>  		crypto_free_shash(sbi->s_chksum_driver);
>> -	kvfree(sbi);
>> +	kfree(sbi);
>>  
>>  	/* give only one another chance */
>>  	if (retry_cnt > 0 && skip_recovery) {
>> diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
>> index 296b3189448a..ff2455b4ad14 100644
>> --- a/fs/f2fs/xattr.c
>> +++ b/fs/f2fs/xattr.c
>> @@ -362,7 +362,7 @@ static int lookup_all_xattrs(struct inode *inode, struct page *ipage,
>>  	*base_addr = txattr_addr;
>>  	return 0;
>>  out:
>> -	kvfree(txattr_addr);
>> +	kfree(txattr_addr);
>>  	return err;
>>  }
>>  
>> @@ -405,7 +405,7 @@ static int read_all_xattrs(struct inode *inode, struct page *ipage,
>>  	*base_addr = txattr_addr;
>>  	return 0;
>>  fail:
>> -	kvfree(txattr_addr);
>> +	kfree(txattr_addr);
>>  	return err;
>>  }
>>  
>> @@ -532,7 +532,7 @@ int f2fs_getxattr(struct inode *inode, int index, const char *name,
>>  	}
>>  	error = size;
>>  out:
>> -	kvfree(base_addr);
>> +	kfree(base_addr);
>>  	return error;
>>  }
>>  
>> @@ -590,7 +590,7 @@ ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
>>  	}
>>  	error = buffer_size - rest;
>>  cleanup:
>> -	kvfree(base_addr);
>> +	kfree(base_addr);
>>  	return error;
>>  }
>>  
>> @@ -731,7 +731,7 @@ static int __f2fs_setxattr(struct inode *inode, int index,
>>  	if (!error && S_ISDIR(inode->i_mode))
>>  		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_CP);
>>  exit:
>> -	kvfree(base_addr);
>> +	kfree(base_addr);
>>  	return error;
>>  }
>>  
>> -- 
>> 2.18.0.rc1
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
