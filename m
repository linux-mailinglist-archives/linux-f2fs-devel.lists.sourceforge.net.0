Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C32794CD0F0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Mar 2022 10:20:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nQ46v-00088a-BU; Fri, 04 Mar 2022 09:20:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nQ46n-00087t-6w
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Mar 2022 09:20:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ADCY3ZNuHOBnoFNrkUYxhQAvhXO95QFh/bFOq4b3sPs=; b=gW5mtPa5z7XWDUiA5vURp/3ciu
 9KxpIOTiRNAh/A9WtzuCWFP4glXb7dM020NgLy67p5vK4RW7Gzhrt+v4b0eRRXa99CsWaMyCj6kfu
 iIJ4e9Hyk/bpeQf5dsXdKq0Kb/v708jwMqUYD/h9Tav+PhfRMEjGHyDlXIfMsKbKLcFI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ADCY3ZNuHOBnoFNrkUYxhQAvhXO95QFh/bFOq4b3sPs=; b=fulbEC2P5grPkScMjKld4ARySQ
 Og6PwHnDCgkrTpzA+goxc4WyjyzOwyRaJDA/c8EO5HOJsf1z3BJH48y7S3P6ZmkuzhbEvz30/ZagX
 e2RaoN5DrCn8smp7zl/xuGWqhVVTgkB4q3JRMLp+uaSeen3YjF5qCXaTx2OrFjIvPt3g=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nQ46k-004bNZ-6n
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Mar 2022 09:20:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AFD43B827AC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  4 Mar 2022 09:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 764FEC340E9;
 Fri,  4 Mar 2022 09:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646385607;
 bh=BgT01SavR8sDl65eqFTvI9Ru7MGrthbPR0fmy3vPemE=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=DOVv5kkvwhV8JpVukdBOCGyIWtRXHDKc+OENyWtAKDq4F3lrX4u8GQ/r50vgoYe0u
 yBFs9t+S95NGxe/SssdAi6u7e4JMwc2nqa48xSefxeRdNxXpiQrXcxbvFvue/0ElCC
 iVlilFQdVqQol0I9hzbsf3pmUl5tK3JMsD5z7X6XjbAtQ4QZnzgJ5uLO1fe6bA6MzP
 0pcZFOLEp3bfFHHuCU+nuSP7gMxcOpTZWE+wyltraswt5I2RvFeu6FKQ4EdmULg6Mc
 XROAke2QmhmZMlzdHG6e+7dHQ4jOxekVucwwUxFzffdFxVk1bpc3lhsHNweuZaRq9u
 gnR7fHKI/ltkQ==
Message-ID: <303313a4-f529-ce12-e512-082db535d0f5@kernel.org>
Date: Fri, 4 Mar 2022 17:20:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220304021955.2524246-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220304021955.2524246-1-jaegeuk@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/3/4 10:19, Jaegeuk Kim wrote: > If one read IO is
 always failing, we can fall into an infinite loop in > f2fs_sync_dirty_inodes.
 This happens during xfstests/generic/475. > > [ 142.803335] Buf [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nQ46k-004bNZ-6n
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: avoid an infinite loop in
 f2fs_sync_dirty_inodes
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/3/4 10:19, Jaegeuk Kim wrote:
> If one read IO is always failing, we can fall into an infinite loop in
> f2fs_sync_dirty_inodes. This happens during xfstests/generic/475.
> 
> [  142.803335] Buffer I/O error on dev dm-1, logical block 8388592, async page read
> ...
> [  382.887210]  submit_bio_noacct+0xdd/0x2a0
> [  382.887213]  submit_bio+0x80/0x110
> [  382.887223]  __submit_bio+0x4d/0x300 [f2fs]
> [  382.887282]  f2fs_submit_page_bio+0x125/0x200 [f2fs]
> [  382.887299]  __get_meta_page+0xc9/0x280 [f2fs]
> [  382.887315]  f2fs_get_meta_page+0x13/0x20 [f2fs]
> [  382.887331]  f2fs_get_node_info+0x317/0x3c0 [f2fs]
> [  382.887350]  f2fs_do_write_data_page+0x327/0x6f0 [f2fs]
> [  382.887367]  f2fs_write_single_data_page+0x5b7/0x960 [f2fs]
> [  382.887386]  f2fs_write_cache_pages+0x302/0x890 [f2fs]
> [  382.887405]  ? preempt_count_add+0x7a/0xc0
> [  382.887408]  f2fs_write_data_pages+0xfd/0x320 [f2fs]
> [  382.887425]  ? _raw_spin_unlock+0x1a/0x30
> [  382.887428]  do_writepages+0xd3/0x1d0
> [  382.887432]  filemap_fdatawrite_wbc+0x69/0x90
> [  382.887434]  filemap_fdatawrite+0x50/0x70
> [  382.887437]  f2fs_sync_dirty_inodes+0xa4/0x270 [f2fs]
> [  382.887453]  f2fs_write_checkpoint+0x189/0x1640 [f2fs]
> [  382.887469]  ? schedule_timeout+0x114/0x150
> [  382.887471]  ? ttwu_do_activate+0x6d/0xb0
> [  382.887473]  ? preempt_count_add+0x7a/0xc0
> [  382.887476]  kill_f2fs_super+0xca/0x100 [f2fs]
> [  382.887491]  deactivate_locked_super+0x35/0xa0
> [  382.887494]  deactivate_super+0x40/0x50
> [  382.887497]  cleanup_mnt+0x139/0x190
> [  382.887499]  __cleanup_mnt+0x12/0x20
> [  382.887501]  task_work_run+0x64/0xa0
> [  382.887505]  exit_to_user_mode_prepare+0x1b7/0x1c0
> [  382.887508]  syscall_exit_to_user_mode+0x27/0x50
> [  382.887510]  do_syscall_64+0x48/0xc0
> [  382.887513]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
