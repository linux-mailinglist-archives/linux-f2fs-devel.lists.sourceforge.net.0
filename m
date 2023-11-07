Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEC87E414A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Nov 2023 14:56:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r0MYa-0000Tf-Ax;
	Tue, 07 Nov 2023 13:55:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1r0MYY-0000TX-MF
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Nov 2023 13:55:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KAVoPKwZmPujrQUEzfbIlnC2deoMNn0zys0VqfJA160=; b=UH3MFHo8hgdM+Sj2OSyJjMmH4u
 7Z0L1tnABxEkUTTKXY6dzzrxQv79Uc6hOFfjWRT7YNDCfzGXn94fhExqMQROHEL7WlBLSeRHTcCva
 6umkXRV7U/r4068gdBGMsO7pil+uNyoObwZ3kFmPjBgDc2pjI1el4wHjW3z/zWugzCmg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KAVoPKwZmPujrQUEzfbIlnC2deoMNn0zys0VqfJA160=; b=Xo0bkd0WcfoCe4TdnBjHjeRIDk
 F3FW0NgcH9fZPQACuC2l2lw9j3POSaXkD0qqOS46lDlAdOIelKPzMxw3Fo4PE7u3phqlVhYMRROlr
 zZMpPz9WAb0hKaeeM8d38a6ntW8Vlgj9+b56SLPfvfmRG/urDpkUAAQ/PPvkN/PEa73Y=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r0MYX-0004y7-MU for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Nov 2023 13:55:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 191CACE0219;
 Tue,  7 Nov 2023 13:55:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40508C433C8;
 Tue,  7 Nov 2023 13:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699365342;
 bh=MezwdNposfNXG2orKfNEfaD6ELS73ydUqk05+JkokFc=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=BGdBi/DFC+qLlPIJwKRW1zKfsKHtJt/sHqj019yxcoFZemUY11tWCVltoekoxrv1s
 jPMtNaWWznziiOGpNBpCyWhwVPF93tz5COveJkuedJjWYWjuKEJq/Ur1QTo4ile0fF
 2X7pB5mrhKsJxcbYlLyCRGZ8+CPOFjevhxBXyCAZAg9xQs0zMc0snrNHjzjt8w663y
 ExTwZ06jymVrM92JDbWCsbM0eeTSMSCB1hD7sjSETFlSu1kA9P/ddUghfx0FLKeIT2
 Csrw1lAul8ydceYG8m6yMpunyctpj4/jeaVrGDmwG8U9Er0CLJWBPSXm4WwCjgQxtF
 fmZBwiD2YtZUQ==
Message-ID: <b458cd8f-8af0-5848-29dc-353d536ee77a@kernel.org>
Date: Tue, 7 Nov 2023 21:55:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Jan Kara <jack@suse.cz>, Al Viro <viro@zeniv.linux.org.uk>
References: <20231011203412.GA85476@ZenIV>
 <CAHk-=wjSbompMCgMwR2-MB59QDB+OZ7Ohp878QoDc9o7z4pbNg@mail.gmail.com>
 <20231011215138.GX800259@ZenIV> <20231011230105.GA92231@ZenIV>
 <CAHfrynNbfPtAjY4Y7N0cyWyH35dyF_BcpfR58ASCCC7=-TfSFw@mail.gmail.com>
 <20231012050209.GY800259@ZenIV> <20231012103157.mmn6sv4e6hfrqkai@quack3>
 <20231012145758.yopnkhijksae5akp@quack3> <20231012191551.GZ800259@ZenIV>
 <20231017055040.GN800259@ZenIV> <20231026161653.cunh4ojohq6mw2ye@quack3>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20231026161653.cunh4ojohq6mw2ye@quack3>
X-Spam-Score: -4.9 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/10/27 0:16, Jan Kara wrote: > Jaegeuk, Chao,
 any comment
 on this? It really looks like a filesystem > corruption issue in f2fs when
 whiteouts are used... Sorry for delay reply, I was busy handling product
 issues these days... 
 Content analysis details:   (-4.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r0MYX-0004y7-MU
Subject: Re: [f2fs-dev] [RFC] weirdness in f2fs_rename() with RENAME_WHITEOUT
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
Cc: linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/10/27 0:16, Jan Kara wrote:
> Jaegeuk, Chao, any comment on this? It really looks like a filesystem
> corruption issue in f2fs when whiteouts are used...

Sorry for delay reply, I was busy handling product issues these days...

Let me check this ASAP.

Thanks,

> 
> 								Honza
> 
> On Tue 17-10-23 06:50:40, Al Viro wrote:
>> [f2fs folks Cc'd]
>>
>> 	There's something very odd in f2fs_rename();
>> this:
>>          f2fs_down_write(&F2FS_I(old_inode)->i_sem);
>>          if (!old_dir_entry || whiteout)
>>                  file_lost_pino(old_inode);
>>          else
>>                  /* adjust dir's i_pino to pass fsck check */
>>                  f2fs_i_pino_write(old_inode, new_dir->i_ino);
>>          f2fs_up_write(&F2FS_I(old_inode)->i_sem);
>> and this:
>>                  if (old_dir != new_dir && !whiteout)
>>                          f2fs_set_link(old_inode, old_dir_entry,
>>                                                  old_dir_page, new_dir);
>>                  else
>>                          f2fs_put_page(old_dir_page, 0);
>> The latter really stinks, especially considering
>> struct dentry *f2fs_get_parent(struct dentry *child)
>> {
>>          struct page *page;
>>          unsigned long ino = f2fs_inode_by_name(d_inode(child), &dotdot_name, &page);
>>
>>          if (!ino) {
>>                  if (IS_ERR(page))
>>                          return ERR_CAST(page);
>>                  return ERR_PTR(-ENOENT);
>>          }
>>          return d_obtain_alias(f2fs_iget(child->d_sb, ino));
>> }
>>
>> You want correct inumber in the ".." link.  And cross-directory
>> rename does move the source to new parent, even if you'd been asked
>> to leave a whiteout in the old place.
>>
>> Why is that stuff conditional on whiteout?  AFAICS, that went into the
>> tree in the same commit that added RENAME_WHITEOUT support on f2fs,
>> mentioning "For now, we just try to follow the way that xfs/ext4 use"
>> in commit message.  But ext4 does *NOT* do anything of that sort -
>> at the time of that commit the relevant piece had been
>>          if (old.dir_bh) {
>> 		retval = ext4_rename_dir_finish(handle, &old, new.dir->i_ino);
>> and old.dir_bh is set by
>>                  retval = ext4_rename_dir_prepare(handle, &old);
>> a few lines prior, which is not conditional upon the whiteout.
>>
>> What am I missing there?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
