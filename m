Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF3574918C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jul 2023 01:19:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qHBmd-0003hq-CH;
	Wed, 05 Jul 2023 23:19:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dlemoal@kernel.org>) id 1qHBmc-0003hb-7b;
 Wed, 05 Jul 2023 23:19:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=slKcgiQ5FEofTrznkGRK93lJ2moJwj/7nqB+sNLe2dk=; b=VYxblbeVhd8rgqktQcoEY9CZho
 no0zNH++fmWbhRKKf+2ICvUHDnmy5x3hINyPjrQ9ucjAufG1zlQeXYCMArtOgatejaP4+hceBC1Dz
 WbCJi7NSiSxVJBrB45nXopbc/GSgBOPvskerSmu9ducO9wsmN0L+578pQ5q6xBypkHhQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=slKcgiQ5FEofTrznkGRK93lJ2moJwj/7nqB+sNLe2dk=; b=VOtsJDSvmWW/oJtYX5OnAdAeJF
 5FiEEkViBOCGcLpIbV8ZdoSN+dhr/YWleQyzh4LM85AjrFxMfY8k0+IML2Thv6JXV8e7La3yXB4Jh
 tbvHu110auJI/NnCKEuEbaIl4Wh0akDM53Egk3qivZw4LylKhtolS7G9DTerYNR3C8tI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qHBmY-007nKH-NR; Wed, 05 Jul 2023 23:19:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3CA2F617C4;
 Wed,  5 Jul 2023 23:19:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D28EAC433C7;
 Wed,  5 Jul 2023 23:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688599164;
 bh=KCTloaubNslRR/SoL8UluRoG/IUPJVjSzADYJrfAJHU=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=b2X6YIL6Vy56XALQtKdhzhDP4FaYYu72cv/nQy9J7p20qPoaFddY4NYMECi8UiElG
 KXeBp5mYG0Tr3Z/9dS3G7DFV3U+NrS3kS1Bj4OLdG2oLV7lkerc27aKsKkqjab0O9K
 FATIdox5v3Da+YKWUBF3YXN3ElwAHoGXAASphNzizKagSfTJcPF38/AQplhEub1AKR
 LkLgfDZcW1uv2KNe1PZmf257zQ+kLCx4ktYMXGFo0Ya/ipY5JnCfPPINteVMs1bXpn
 61eVfSZI95423vo52gH8KvQcVqXg5RZ32hLmWLwnt3Gj7afC9O4NqxdEhtaz5kVF+Y
 8axRcbIlbfAZA==
Message-ID: <3b403ef1-22e6-0220-6c9c-435e3444b4d3@kernel.org>
Date: Thu, 6 Jul 2023 08:19:00 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Jeff Layton <jlayton@kernel.org>, jk@ozlabs.org, arnd@arndb.de,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com, gregkh@linuxfoundation.org,
 arve@android.com, tkjos@android.com, maco@android.com,
 joel@joelfernandes.org, brauner@kernel.org, cmllamas@google.com,
 surenb@google.com, dennis.dalessandro@cornelisnetworks.com, jgg@ziepe.ca,
 leon@kernel.org, bwarrum@linux.ibm.com, rituagar@linux.ibm.com,
 ericvh@kernel.org, lucho@ionkov.net, asmadeus@codewreck.org,
 linux_oss@crudebyte.com, dsterba@suse.com, dhowells@redhat.com,
 marc.dionne@auristor.com, viro@zeniv.linux.org.uk, raven@themaw.net,
 luisbg@kernel.org, salah.triki@gmail.com, aivazian.tigran@gmail.com,
 ebiederm@xmission.com, keescook@chromium.org, clm@fb.com,
 josef@toxicpanda.com, xiubli@redhat.com, idryomov@gmail.com,
 jaharkes@cs.cmu.edu, coda@cs.cmu.edu, jlbec@evilplan.org, hch@lst.de,
 nico@fluxnic.net, rafael@kernel.org, code@tyhicks.com, ardb@kernel.org,
 xiang@kernel.org, chao@kernel.org, huyue2@coolpad.com,
 jefflexu@linux.alibaba.com, linkinjeon@kernel.org, sj1557.seo@samsung.com,
 jack@suse.com, tytso@mit.edu, adilger.kernel@dilger.ca, jaegeuk@kernel.org,
 hirofumi@mail.parknet.co.jp, miklos@szeredi.hu, rpeterso@redhat.com,
 agruenba@redhat.com, richard@nod.at, anton.ivanov@cambridgegreys.com,
 johannes@sipsolutions.net, mikulas@artax.karlin.mff.cuni.cz,
 mike.kravetz@oracle.com, muchun.song@linux.dev, dwmw2@infradead.org,
 shaggy@kernel.org, tj@kernel.org, trond.myklebust@hammerspace.com,
 anna@kernel.org, chuck.lever@oracle.com, neilb@suse.de, kolga@netapp.com,
 Dai.Ngo@oracle.com, tom@talpey.com, konishi.ryusuke@gmail.com,
 anton@tuxera.com, almaz.alexandrovich@paragon-software.com, mark@fasheh.com,
 joseph.qi@linux.alibaba.com, me@bobcopeland.com, hubcap@omnibond.com,
 martin@omnibond.com, amir73il@gmail.com, mcgrof@kernel.org,
 yzaikin@google.com, tony.luck@intel.com, gpiccoli@igalia.com,
 al@alarsen.net, sfrench@samba.org, pc@manguebit.com, lsahlber@redhat.com,
 sprasad@microsoft.com, senozhatsky@chromium.org, phillip@squashfs.org.uk,
 rostedt@goodmis.org, mhiramat@kernel.org, dushistov@mail.ru,
 hdegoede@redhat.com, djwong@kernel.org, naohiro.aota@wdc.com,
 jth@kernel.org, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, song@kernel.org, yhs@fb.com, john.fastabend@gmail.com,
 kpsingh@kernel.org, sdf@google.com, haoluo@google.com, jolsa@kernel.org,
 hughd@google.com, akpm@linux-foundation.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
 serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org,
 jgross@suse.com, stern@rowland.harvard.edu, lrh2000@pku.edu.cn,
 sebastian.reichel@collabora.com, wsa+renesas@sang-engineering.com,
 quic_ugoswami@quicinc.com, quic_linyyuan@quicinc.com, john@keeping.me.uk,
 error27@gmail.com, quic_uaggarwa@quicinc.com, hayama@lineo.co.jp,
 jomajm@gmail.com, axboe@kernel.dk, dhavale@google.com, dchinner@redhat.com,
 hannes@cmpxchg.org, zhangpeng362@huawei.com, slava@dubeyko.com,
 gargaditya08@live.com, penguin-kernel@I-love.SAKURA.ne.jp,
 yifeliu@cs.stonybrook.edu, madkar@cs.stonybrook.edu, ezk@cs.stonybrook.edu,
 yuzhe@nfschina.com, willy@infradead.org, okanatov@gmail.com,
 jeffxu@chromium.org, linux@treblig.org, mirimmad17@gmail.com,
 yijiangshan@kylinos.cn, yang.yang29@zte.com.cn, xu.xin16@zte.com.cn,
 chengzhihao1@huawei.com, shr@devkernel.io, Liam.Howlett@Oracle.com,
 adobriyan@gmail.com, chi.minghao@zte.com.cn, roberto.sassu@huawei.com,
 linuszeng@tencent.com, bvanassche@acm.org, zohar@linux.ibm.com,
 yi.zhang@huawei.com, trix@redhat.com, fmdefrancesco@gmail.com,
 ebiggers@google.com, princekumarmaurya06@gmail.com, chenzhongjin@huawei.com,
 riel@surriel.com, shaozhengchao@huawei.com, jingyuwang_vip@163.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-usb@vger.kernel.org, v9fs@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org,
 autofs@vger.kernel.org, linux-mm@kvack.org, linux-btrfs@vger.kernel.org,
 ceph-devel@vger.kernel.org, codalist@coda.cs.cmu.edu,
 ecryptfs@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-um@lists.infradead.org, linux-mtd@lists.infradead.org,
 jfs-discussion@lists.sourceforge.net, linux-nfs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 ntfs3@lists.linux.dev, ocfs2-devel@lists.linux.dev,
 linux-karma-devel@lists.sourceforge.net, devel@lists.orangefs.org,
 linux-unionfs@vger.kernel.org, linux-hardening@vger.kernel.org,
 reiserfs-devel@vger.kernel.org, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-trace-kernel@vger.kernel.org,
 linux-xfs@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org,
 selinux@vger.kernel.org
References: <20230705185812.579118-1-jlayton@kernel.org>
 <20230705185812.579118-3-jlayton@kernel.org>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20230705185812.579118-3-jlayton@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/6/23 03:58, Jeff Layton wrote: > A rename potentially
 involves updating 4 different inode timestamps. Add > a function that handles
 the details sanely, and convert the libfs.c > callers to use it [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qHBmY-007nKH-NR
Subject: Re: [f2fs-dev] [PATCH v2 08/92] fs: new helper:
 simple_rename_timestamp
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/6/23 03:58, Jeff Layton wrote:
> A rename potentially involves updating 4 different inode timestamps. Add
> a function that handles the details sanely, and convert the libfs.c
> callers to use it.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/libfs.c         | 36 +++++++++++++++++++++++++++---------
>  include/linux/fs.h |  2 ++
>  2 files changed, 29 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/libfs.c b/fs/libfs.c
> index a7e56baf8bbd..9ee79668c909 100644
> --- a/fs/libfs.c
> +++ b/fs/libfs.c
> @@ -692,6 +692,31 @@ int simple_rmdir(struct inode *dir, struct dentry *dentry)
>  }
>  EXPORT_SYMBOL(simple_rmdir);
>  
> +/**
> + * simple_rename_timestamp - update the various inode timestamps for rename
> + * @old_dir: old parent directory
> + * @old_dentry: dentry that is being renamed
> + * @new_dir: new parent directory
> + * @new_dentry: target for rename
> + *
> + * POSIX mandates that the old and new parent directories have their ctime and
> + * mtime updated, and that inodes of @old_dentry and @new_dentry (if any), have
> + * their ctime updated.
> + */
> +void simple_rename_timestamp(struct inode *old_dir, struct dentry *old_dentry,
> +			     struct inode *new_dir, struct dentry *new_dentry)
> +{
> +	struct inode *newino = d_inode(new_dentry);
> +
> +	old_dir->i_mtime = inode_set_ctime_current(old_dir);
> +	if (new_dir != old_dir)
> +		new_dir->i_mtime = inode_set_ctime_current(new_dir);
> +	inode_set_ctime_current(d_inode(old_dentry));
> +	if (newino)
> +		inode_set_ctime_current(newino);
> +}
> +EXPORT_SYMBOL_GPL(simple_rename_timestamp);
> +
>  int simple_rename_exchange(struct inode *old_dir, struct dentry *old_dentry,
>  			   struct inode *new_dir, struct dentry *new_dentry)
>  {
> @@ -707,11 +732,7 @@ int simple_rename_exchange(struct inode *old_dir, struct dentry *old_dentry,
>  			inc_nlink(old_dir);
>  		}
>  	}
> -	old_dir->i_ctime = old_dir->i_mtime =
> -	new_dir->i_ctime = new_dir->i_mtime =
> -	d_inode(old_dentry)->i_ctime =
> -	d_inode(new_dentry)->i_ctime = current_time(old_dir);
> -
> +	simple_rename_timestamp(old_dir, old_dentry, new_dir, new_dentry);

This is somewhat changing the current behavior: before the patch, the mtime and
ctime of old_dir, new_dir and the inodes associated with the dentries are always
equal. But given that simple_rename_timestamp() calls inode_set_ctime_current()
4 times, the times could potentially be different.

I am not sure if that is an issue, but it seems that calling
inode_set_ctime_current() once, recording the "now" time it sets and using that
value to set all times may be more efficient and preserve the existing behavior.

>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(simple_rename_exchange);
> @@ -720,7 +741,6 @@ int simple_rename(struct mnt_idmap *idmap, struct inode *old_dir,
>  		  struct dentry *old_dentry, struct inode *new_dir,
>  		  struct dentry *new_dentry, unsigned int flags)
>  {
> -	struct inode *inode = d_inode(old_dentry);
>  	int they_are_dirs = d_is_dir(old_dentry);
>  
>  	if (flags & ~(RENAME_NOREPLACE | RENAME_EXCHANGE))
> @@ -743,9 +763,7 @@ int simple_rename(struct mnt_idmap *idmap, struct inode *old_dir,
>  		inc_nlink(new_dir);
>  	}
>  
> -	old_dir->i_ctime = old_dir->i_mtime = new_dir->i_ctime =
> -		new_dir->i_mtime = inode->i_ctime = current_time(old_dir);
> -
> +	simple_rename_timestamp(old_dir, old_dentry, new_dir, new_dentry);
>  	return 0;
>  }
>  EXPORT_SYMBOL(simple_rename);
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index bdfbd11a5811..14e38bd900f1 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2979,6 +2979,8 @@ extern int simple_open(struct inode *inode, struct file *file);
>  extern int simple_link(struct dentry *, struct inode *, struct dentry *);
>  extern int simple_unlink(struct inode *, struct dentry *);
>  extern int simple_rmdir(struct inode *, struct dentry *);
> +void simple_rename_timestamp(struct inode *old_dir, struct dentry *old_dentry,
> +			     struct inode *new_dir, struct dentry *new_dentry);
>  extern int simple_rename_exchange(struct inode *old_dir, struct dentry *old_dentry,
>  				  struct inode *new_dir, struct dentry *new_dentry);
>  extern int simple_rename(struct mnt_idmap *, struct inode *,

-- 
Damien Le Moal
Western Digital Research



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
