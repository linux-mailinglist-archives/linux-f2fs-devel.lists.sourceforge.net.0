Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB192803C56
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Dec 2023 19:07:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rADLr-0006jN-1G;
	Mon, 04 Dec 2023 18:07:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <htejun@gmail.com>) id 1rADLp-0006jG-KA
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Dec 2023 18:07:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vnKGL9rVmaXJ0k7UQTGGb8qgGBw3yaFYXulmlj0ClVk=; b=CJuJmqVHoZRiHavszrxikAV5NG
 KGfbH5Wo6ROcivxdkwy2L3IdyI07X22typab1itApfpMFl9fIZTwplFMTq8QSA9RKwDMAoRzyHbS3
 /nvR06+sdI6l0KR4PPy8YQNk8cb7vVClTK3rbyqc5hFpzygjtyrYxj1qlDuHr04FNk94=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vnKGL9rVmaXJ0k7UQTGGb8qgGBw3yaFYXulmlj0ClVk=; b=JRja9b7puHh+2ps+Kh/7XcqJLS
 +ybqij0UV2a7Ya935I1A1uPlp1Mi5nAGvpiwNE7VkaEe7lWcRCJVL/k1wxOUrrikZvtey+ggb/LZs
 V+dSxu3MGdHofxqcY6jI3wddGNVdcIBTe0Px6Zl7AZEZYO+6S1THiCMXP7WFqHxGUne4=;
Received: from mail-pf1-f172.google.com ([209.85.210.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rADLl-0003kL-9I for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Dec 2023 18:07:24 +0000
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-6ce387bcb06so959923b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 04 Dec 2023 10:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701713230; x=1702318030; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=vnKGL9rVmaXJ0k7UQTGGb8qgGBw3yaFYXulmlj0ClVk=;
 b=HEXl0bfLXskrEDlprtgQ9Ox3hBhKh2naijYuJ8Ucpkn8+j+bwTE9jn4Vik8zORJIfO
 Hd4oSo/ZKixfnGOr8aSnjRQPx8LGt3+QWXEfNVx2wTXE9KTMBLcQc6vFR3cz0ivBbRW2
 QVfhhtvEclIeZtPTKbGiHATQaS4c62a+Xz3mSUqcYmo6RjTKkU9pvgIhxeTtlvU1Y2q6
 3G7Vqrodhmq4nhzmCuGV6BJl6VX7nrKFbH7F9vnC4pKWT+TMqn8nRsY2id9StW4EwOpr
 cq1QmW5kuYoAcgvEqOUztxVEScwB4GJnJD/4QvCzy6JqxHoBJBq9aahLhJdGXwWseFhE
 JO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701713230; x=1702318030;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vnKGL9rVmaXJ0k7UQTGGb8qgGBw3yaFYXulmlj0ClVk=;
 b=PxKn7k2o+MIKO3/U9ZeeKEnjLxvtwaeyiJJlzqPbQStmbkIMLgrA0vjDhMcQLcGwTw
 5s0+7/ueXJPRVz5ChRYi6ICFGoUwSC531aF9gV578aczHhUogS5OcjJ8SA+5Qtdzi+Cd
 VxQ7E7ie3IKoA7mPNj2tknl8Zm0z3mNfeK7IJf0gMD+CYCC7oUX+ZXH8VHHjoiMwEnaw
 iyI30fyXJmLnGjSiQYqqtB3+K+bbJzmIR89jLwJlmBLCIOUIy7DTjRYmdqGP0QMbXyJf
 TDgbaPaEAXr4J4kfyV5Nr6cKsdXZA/V0BNALenn2ApiAjFwj6PTf1a5xcyFWsJS0EE+m
 5cFw==
X-Gm-Message-State: AOJu0Yw7KwGLM4S3ayDhYo23R8qy4w+TiIX8EqXtdCtTARtULc3QTUp8
 pRXMM9ooqHGZuEaJI/6bK0xubIwwt1E=
X-Google-Smtp-Source: AGHT+IGDIGeeBa7UWPj4E4w2SIGHBjZgGz8oxGqwAWzNb+KD7mpnEvIno4bt3NIHORxil3wMtNwC4w==
X-Received: by 2002:a05:6a20:1448:b0:18c:374c:6e64 with SMTP id
 a8-20020a056a20144800b0018c374c6e64mr27716780pzi.36.1701713229690; 
 Mon, 04 Dec 2023 10:07:09 -0800 (PST)
Received: from localhost ([2620:10d:c090:400::4:27ef])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a056a00158200b006cdd507ca2esm7943470pfk.167.2023.12.04.10.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 10:07:09 -0800 (PST)
Date: Mon, 4 Dec 2023 08:07:07 -1000
From: Tejun Heo <tj@kernel.org>
To: Naohiro Aota <Naohiro.Aota@wdc.com>
Message-ID: <ZW4VS3Z0auYCjg-W@slm.duckdns.org>
References: <dbu6wiwu3sdhmhikb2w6lns7b27gbobfavhjj57kwi2quafgwl@htjcc5oikcr3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dbu6wiwu3sdhmhikb2w6lns7b27gbobfavhjj57kwi2quafgwl@htjcc5oikcr3>
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello, On Mon, Dec 04, 2023 at 04:03:47PM +0000, Naohiro Aota
 wrote: > Recently, commit 636b927eba5b ("workqueue: Make unbound workqueues
 to use > per-cpu pool_workqueues") changed WQ_UNBOUND workqueue's beh [...]
 Content analysis details:   (0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.172 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [htejun[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.172 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1rADLl-0003kL-9I
Subject: Re: [f2fs-dev] Performance drop due to alloc_workqueue() misuse and
 recent change
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "gfs2@lists.linux.dev" <gfs2@lists.linux.dev>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "oss-drivers@corigine.com" <oss-drivers@corigine.com>,
 "target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "linux-bcachefs@vger.kernel.org" <linux-bcachefs@vger.kernel.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
 "open-iscsi@googlegroups.com" <open-iscsi@googlegroups.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dm-devel@lists.linux.dev" <dm-devel@lists.linux.dev>,
 "coreteam@netfilter.org" <coreteam@netfilter.org>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>,
 "nbd@other.debian.org" <nbd@other.debian.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-fscrypt@vger.kernel.org" <linux-fscrypt@vger.kernel.org>,
 "ntb@lists.linux.dev" <ntb@lists.linux.dev>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
 "linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

On Mon, Dec 04, 2023 at 04:03:47PM +0000, Naohiro Aota wrote:
> Recently, commit 636b927eba5b ("workqueue: Make unbound workqueues to use
> per-cpu pool_workqueues") changed WQ_UNBOUND workqueue's behavior. It
> changed the meaning of alloc_workqueue()'s max_active from an upper limit
> imposed per NUMA node to a limit per CPU. As a result, massive number of
> workers can be running at the same time, especially if the workqueue user
> thinks the max_active is a global limit.
> 
> Actually, it is already written it is per-CPU limit in the documentation
> before the commit. However, several callers seem to misuse max_active,
> maybe thinking it is a global limit. It is an unexpected behavior change
> for them.

Right, and the behavior has been like that for a very long time and there
was no other way to achieve reasonable level of concurrency, so the current
situation is expected.

> For example, these callers set max_active = num_online_cpus(), which is a
> suspicious limit applying to per-CPU. This config means we can have nr_cpu
> * nr_cpu active tasks working at the same time.

Yeah, that sounds like a good indicator.

> fs/f2fs/data.c: sbi->post_read_wq = alloc_workqueue("f2fs_post_read_wq",
> fs/f2fs/data.c-                                          WQ_UNBOUND | WQ_HIGHPRI,
> fs/f2fs/data.c-                                          num_online_cpus());
> 
> fs/crypto/crypto.c:     fscrypt_read_workqueue = alloc_workqueue("fscrypt_read_queue",
> fs/crypto/crypto.c-                                              WQ_UNBOUND | WQ_HIGHPRI,
> fs/crypto/crypto.c-                                              num_online_cpus());
> 
> fs/verity/verify.c:     fsverity_read_workqueue = alloc_workqueue("fsverity_read_queue",
> fs/verity/verify.c-                                               WQ_HIGHPRI,
> fs/verity/verify.c-                                               num_online_cpus());
> 
> drivers/crypto/hisilicon/qm.c:  qm->wq = alloc_workqueue("%s", WQ_HIGHPRI | WQ_MEM_RECLAIM |
> drivers/crypto/hisilicon/qm.c-                           WQ_UNBOUND, num_online_cpus(),
> drivers/crypto/hisilicon/qm.c-                           pci_name(qm->pdev));
> 
> block/blk-crypto-fallback.c:    blk_crypto_wq = alloc_workqueue("blk_crypto_wq",
> block/blk-crypto-fallback.c-                                    WQ_UNBOUND | WQ_HIGHPRI |
> block/blk-crypto-fallback.c-                                    WQ_MEM_RECLAIM, num_online_cpus());
> 
> drivers/md/dm-crypt.c:          cc->crypt_queue = alloc_workqueue("kcryptd/%s",
> drivers/md/dm-crypt.c-                                            WQ_CPU_INTENSIVE | WQ_MEM_RECLAIM | WQ_UNBOUND,
> drivers/md/dm-crypt.c-                                            num_online_cpus(), devname);

Most of these work items are CPU bound but not completley so. e.g.
kcrypt_crypt_write_continue() does wait_for_completion(), so setting
max_active to 1 likely isn't what they want either. They mostly want some
reasonable system-wide concurrency limit w.r.t. the CPU count while keeping
some level of flexibility in terms of task placement.

The previous max_active wasn't great for this because its meaning changed
depending on the number of nodes. Now, the meaning doesn't change but it's
not really useful for the above purpose. It's only useful for avoiding
melting the system completely.

One way to go about it is to declare that concurrency level management for
unbound workqueue is on users but that seems not ideal given many use cases
would want it anyway.

Let me think it over but I think the right way to go about it is going the
other direction - ie. making max_active apply to the whole system regardless
of the number of nodes / ccx's / whatever.

> Furthermore, the change affects performance in a certain case.
> 
> Btrfs creates several WQ_UNBOUND workqueues with a default max_active =
> min(NRCPUS + 2, 8). As my machine has 96 CPUs with NUMA disabled, this
> max_active config allows running over 700 active works. Before the commit,
> it is limited to 8 if NUMA is disabled or limited to 16 if NUMA nodes is 2.
> 
> I reverted the workqueue code back to before the commit, and I ran the
> following fio command on RAID0 btrfs on 6 SSDs.
> 
> fio --group_reporting --eta=always --eta-interval=30s --eta-newline=30s \
>     --rw=write --fallocate=none \
>     --direct=1 --ioengine=libaio --iodepth=32 \
>     --filesize=100G \
>     --blocksize=64k \
>     --time_based --runtime=300s \
>     --end_fsync=1 \
>     --directory=${MNT} \
>     --name=writer --numjobs=32
> 
> By changing workqueue's max_active, the result varies.
> 
> - wq max_active=8   (intended limit by btrfs?)
>   WRITE: bw=2495MiB/s (2616MB/s), 2495MiB/s-2495MiB/s (2616MB/s-2616MB/s), io=753GiB (808GB), run=308953-308953msec
> - wq max_active=16  (actual limit on 2 NUMA nodes setup)
>   WRITE: bw=1736MiB/s (1820MB/s), 1736MiB/s-1736MiB/s (1820MB/s-1820MB/s), io=670GiB (720GB), run=395532-395532msec
> - wq max_active=768 (simulating current limit)
>   WRITE: bw=1276MiB/s (1338MB/s), 1276MiB/s-1276MiB/s (1338MB/s-1338MB/s), io=375GiB (403GB), run=300984-300984msec
> 
> The current performance is slower than the previous limit (max_active=16)
> by 27%, or it is 50% slower than the intended limit.  The performance drop
> might be due to contention of the btrfs-endio-write works. There are over
> 700 kworker instances were created and 100 works are on the 'D' state
> competing for a lock.
> 
> More specifically, I tested the same workload on the commit.
> 
> - At commit 636b927eba5b ("workqueue: Make unbound workqueues to use per-cpu pool_workqueues")
>   WRITE: bw=1191MiB/s (1249MB/s), 1191MiB/s-1191MiB/s (1249MB/s-1249MB/s), io=350GiB (376GB), run=300714-300714msec
> - At the previous commit = 4cbfd3de73 ("workqueue: Call wq_update_unbound_numa() on all CPUs in NUMA node on CPU hotplug")
>   WRITE: bw=1747MiB/s (1832MB/s), 1747MiB/s-1747MiB/s (1832MB/s-1832MB/s), io=748GiB (803GB), run=438134-438134msec
> 
> So, it is -31.8% performance down with the commit.
> 
> In summary, we misuse max_active, considering it is a global limit. And,
> the recent commit introduced a huge performance drop in some cases.  We
> need to review alloc_workqueue() usage to check if its max_active setting
> is proper or not.

Thanks a lot for the report. I think it's a lot more reasonable to assume
that max_active is global for unbound workqueues. The current workqueue
behavior is not very intuitive or useful. I'll try to find something more
reasonable. Thanks for the report and analysis. Much appreciated.

Thanks.

-- 
tejun


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
