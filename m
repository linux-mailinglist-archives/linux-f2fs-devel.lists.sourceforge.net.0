Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9415618F80D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2020 16:02:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jGOaq-000528-Iv; Mon, 23 Mar 2020 15:02:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jGOap-00051z-6o
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 15:02:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bo/E5jBeTK6yWcHZwBe8L8zZKcDmt/20hkNhiPLYRu8=; b=CakoCWYUe5Y5SJut5hqfVs0rND
 t84d4CkKJosxYyv8QoQizPhzXfU8KdN+xo9Co6xo8H1JPkgdV0nfLNgrMjup7g191bIf3XE3VTg6e
 B5mlByWfm8MDRRc9o2a/8bc+Kqfh8x/3lFUxBpLchAHqRMng83HGXZVvoeOrMsvgnYZw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Bo/E5jBeTK6yWcHZwBe8L8zZKcDmt/20hkNhiPLYRu8=; b=ZNN9zHzuH56MC87Db4wic4IFRD
 hJRJtqXXec8vFRTzVczyFaO9dSHp+vp3gPguPGcHQpRFDocQbaBTh1XWz4od7i+tuEt3Xrfm9lEkn
 V7nJk8UKPjSVjfiTaV5QFRZPpTQ01sEgGN35lzl8vD/irTIDTaTUPDEeoBIowVxubKDQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jGOam-000yAk-2p
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 15:02:19 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9348A2076A;
 Mon, 23 Mar 2020 15:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584975725;
 bh=5fO6AZqUCnCoy7EAmyhzXn/bFghYvSnjrtT9vGqulvc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1tsiV2pE2Iu/4QEd/19FnJE0UQXtjhEVHBVEawrjxCUpI1ppCOsDen/aRRshfGwLT
 lcARiX1vGgDhBmFuKAiw+OL1YwNTvHstpWxn4/h6ORAOW+R8da6N7Uo4Zb0XgMNZiy
 /dn9eAaqWjjto0fZEBGh4QnsZ6qCHzICK9x4dZW0=
Date: Mon, 23 Mar 2020 08:02:05 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: John <graysky@archlinux.us>
Message-ID: <20200323150205.GA119787@google.com>
References: <CAO_nJAYw+-+n584gg2-rRp3KoAsPT5mpD5yRCrwM7hiDMD=PJg@mail.gmail.com>
 <78bdaf48-9699-3a04-efec-95e1a670bfe4@huawei.com>
 <CAO_nJAZ_bW1Bor-sUb8Ouz4VQV28KPZR23njH4VV+eH=BgwR=Q@mail.gmail.com>
 <418f4ee8-14ed-bdfa-d16c-f68c2992f234@huawei.com>
 <CAO_nJAYTbPqWKAnG1+i2J1jnEKN6QtiMV_CxVyranZ-AWK9Agg@mail.gmail.com>
 <20200323041143.GC147648@google.com>
 <CAO_nJAYEGp1129PsFwMdU0ZdjC75DoL60nXhY7KaATgSPz-2DA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAO_nJAYEGp1129PsFwMdU0ZdjC75DoL60nXhY7KaATgSPz-2DA@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jGOam-000yAk-2p
Subject: Re: [f2fs-dev] fstrim does not recognize FSVER=1.13 of F2FS
 partitions
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/23, John wrote:
> On Mon, Mar 23, 2020 at 12:11 AM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
> >
> > On 03/18, John wrote:
> > > On Mon, Mar 16, 2020 at 9:44 PM Chao Yu <yuchao0@huawei.com> wrote:
> > > >
> > > > On 2020/3/16 17:52, John wrote:
> > > > > On Sun, Mar 15, 2020 at 9:24 PM Chao Yu <yuchao0@huawei.com> wrote:
> > > > >>
> > > > >> What's your mount option and mkfs option on those two partitions, and what's
> > > > >> your kernel version?
> > > > >
> > > > > I am mounting the partitions with systemd like so (/etc/fstab entry):
> > > > >   LABEL=incoming         /incoming     f2fs  noauto,x-systemd.automount  0 0
> > > > >
> > > > > But I can reproduce this if I totally remove the entries within
> > > > > /etc/fstab, reboot, and mount manually like this:
> > > > >   mount LABEL=incoming /incoming
> > > >
> > > > However, the directory where you trigger trim is "/mnt/media"?
> > > >
> > > > Quoted:
> > > > "Invoking it manually on the newer one gives this:
> > > > # fstrim -v /mnt/media
> > > > fstrim: /mnt/media: the discard operation is not supported"
> >
> > Hmm, could you share cat /proc/mounts?
> 
> Since I posted, I have completely reformatted the Samsung 860 EVO 2TB.
> Now, it is just a single LUKS partition with f2fs.  I am getting the
> same "fstrim: /mnt/media: the discard operation is not supported"
> error when I try using fstrim -v /mnt/media with it.
> 
> Here is cat /proc/mounts, thank you for the consideration:
> proc /proc proc rw,nosuid,nodev,noexec,relatime 0 0
> sys /sys sysfs rw,nosuid,nodev,noexec,relatime 0 0
> dev /dev devtmpfs rw,nosuid,relatime,size=3903292k,nr_inodes=975823,mode=755 0 0
> run /run tmpfs rw,nosuid,nodev,relatime,mode=755 0 0
> efivarfs /sys/firmware/efi/efivars efivarfs rw,nosuid,nodev,noexec,relatime 0 0
> /dev/sda2 / ext4 rw,relatime 0 0
> securityfs /sys/kernel/security securityfs rw,nosuid,nodev,noexec,relatime 0 0
> tmpfs /dev/shm tmpfs rw,nosuid,nodev 0 0
> devpts /dev/pts devpts rw,nosuid,noexec,relatime,gid=5,mode=620,ptmxmode=000 0 0
> tmpfs /sys/fs/cgroup tmpfs ro,nosuid,nodev,noexec,mode=755 0 0
> cgroup2 /sys/fs/cgroup/unified cgroup2
> rw,nosuid,nodev,noexec,relatime,nsdelegate 0 0
> cgroup /sys/fs/cgroup/systemd cgroup
> rw,nosuid,nodev,noexec,relatime,xattr,name=systemd 0 0
> pstore /sys/fs/pstore pstore rw,nosuid,nodev,noexec,relatime 0 0
> none /sys/fs/bpf bpf rw,nosuid,nodev,noexec,relatime,mode=700 0 0
> cgroup /sys/fs/cgroup/cpuset cgroup rw,nosuid,nodev,noexec,relatime,cpuset 0 0
> cgroup /sys/fs/cgroup/perf_event cgroup
> rw,nosuid,nodev,noexec,relatime,perf_event 0 0
> cgroup /sys/fs/cgroup/hugetlb cgroup rw,nosuid,nodev,noexec,relatime,hugetlb 0 0
> cgroup /sys/fs/cgroup/freezer cgroup rw,nosuid,nodev,noexec,relatime,freezer 0 0
> cgroup /sys/fs/cgroup/memory cgroup rw,nosuid,nodev,noexec,relatime,memory 0 0
> cgroup /sys/fs/cgroup/blkio cgroup rw,nosuid,nodev,noexec,relatime,blkio 0 0
> cgroup /sys/fs/cgroup/cpu,cpuacct cgroup
> rw,nosuid,nodev,noexec,relatime,cpu,cpuacct 0 0
> cgroup /sys/fs/cgroup/rdma cgroup rw,nosuid,nodev,noexec,relatime,rdma 0 0
> cgroup /sys/fs/cgroup/net_cls,net_prio cgroup
> rw,nosuid,nodev,noexec,relatime,net_cls,net_prio 0 0
> cgroup /sys/fs/cgroup/devices cgroup rw,nosuid,nodev,noexec,relatime,devices 0 0
> cgroup /sys/fs/cgroup/pids cgroup rw,nosuid,nodev,noexec,relatime,pids 0 0
> systemd-1 /proc/sys/fs/binfmt_misc autofs
> rw,relatime,fd=29,pgrp=1,timeout=0,minproto=5,maxproto=5,direct,pipe_ino=12920
> 0 0
> hugetlbfs /dev/hugepages hugetlbfs rw,relatime,pagesize=2M 0 0
> mqueue /dev/mqueue mqueue rw,nosuid,nodev,noexec,relatime 0 0
> debugfs /sys/kernel/debug debugfs rw,nosuid,nodev,noexec,relatime 0 0
> tracefs /sys/kernel/tracing tracefs rw,nosuid,nodev,noexec,relatime 0 0
> tmpfs /tmp tmpfs rw,nosuid,nodev 0 0
> configfs /sys/kernel/config configfs rw,nosuid,nodev,noexec,relatime 0 0
> systemd-1 /mnt/media autofs
> rw,relatime,fd=49,pgrp=1,timeout=0,minproto=5,maxproto=5,direct,pipe_ino=14523
> 0 0
> tmpfs /scratch tmpfs rw,lazytime,nodev,relatime,size=6291456k 0 0
> nfsd /proc/fs/nfsd nfsd rw,relatime 0 0
> /dev/mapper/media-crypt /mnt/media f2fs
> rw,lazytime,relatime,background_gc=on,discard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,flush_merge,extent_cache,mode=adaptive,active_logs=6,alloc_mode=default,fsync_mode=posix

- media-crypt means dm-crypt? Any chance to try raw sda?

Could you try this?
- mount -o remount,nodiscard
 : The reason is, as f2fs uses async discard feature with -o discard, it doesn't
   give 0 bytes on fstrim sometimes.

> 0 0
> /dev/mapper/media-crypt /srv/nfs/share f2fs
> ro,lazytime,relatime,background_gc=on,discard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,flush_merge,extent_cache,mode=adaptive,active_logs=6,alloc_mode=default,fsync_mode=posix
> 0 0
> sunrpc /var/lib/nfs/rpc_pipefs rpc_pipefs rw,relatime 0 0
> tmpfs /run/user/1000 tmpfs
> rw,nosuid,nodev,relatime,size=782676k,mode=700,uid=1000,gid=100 0 0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
