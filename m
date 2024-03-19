Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C75E87F562
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Mar 2024 03:23:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rmP8G-0001eE-NY;
	Tue, 19 Mar 2024 02:23:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rmP8B-0001e8-Hq
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Mar 2024 02:23:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LJ6A0xB4AQ9kcaKxpdQ2c77pWbzT1Enjze3NN+n9E2M=; b=H0nmG3tPur//7s6DCTOU3karj8
 0KZh2hZK4iuRBr0CJvXIDWdNVKpWFRwkDek5BNincVMHX9XgUe1PccW2uwHiUlq1PIRTWbCCbkj+v
 YcbA89CCoEP3xTXcpA6Njl5Up4lO4lPRuh0DhTtpHsJ0qrquD4le/SOWlT0URiQYTEBg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LJ6A0xB4AQ9kcaKxpdQ2c77pWbzT1Enjze3NN+n9E2M=; b=Sb6fna9Yu6lKhBrGv2rpi1UcRz
 gCdbotSiJO2n6jRe0AoDpuSN6FS4REUndsLlOXKGnH8fMZ0gLTe0+QRpcyL521Ga01Qr2hXJsbdkL
 DOyeE0izoafAbuPGz/WvBRzJDBuJ0VUYGweDbO5+MpBnhxNny58+hLRXFvqphise/Xpw=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rmP80-0007vn-5k for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Mar 2024 02:23:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 05B54CE0A36;
 Tue, 19 Mar 2024 02:23:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2C65C433F1;
 Tue, 19 Mar 2024 02:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710814979;
 bh=9E9Mm1HUrBSC34QY5qjUm6nKWfEs8EDhBnP3Z7GzAHQ=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=WctUnj5NTfNGhERrZWKCpj0ubA4ajr2YTSBjJnZUAFzEmtQQRavcduhLwEj23rotS
 i0iSOMpRhKOUfSNpyG8lv/PaQV5H5DnIQkVGWgULuYI4AOIwSfWJmXzp3OzTuxs4dc
 +b3XB9ei6fVLMCK8fqQHw7cR6V5Lo7OMF0vbfGoXXYC8WcpKlJTbGK4f+rM/uLSwpW
 h2++MYIkRQImeOlgbJ0RnAmaZMgE5khBkEYin2apWm1nWen2ewD/ILzPiwKeXRJW0k
 weMW101IpPJ3c8wSFOaSnMPzWnbuIBVbXFvndAALiASrkUgqSx3fUJ/YzkTQuLaf1J
 VhwbPsaauceow==
Message-ID: <f4f1cfac-8520-47a1-ad18-b9922aa0545d@kernel.org>
Date: Tue, 19 Mar 2024 10:22:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 Yi Zhang <yi.zhang@redhat.com>, linux-block <linux-block@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Bart Van Assche <bvanassche@acm.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
References: <CAHj4cs-kfojYC9i0G73PRkYzcxCTex=-vugRFeP40g_URGvnfQ@mail.gmail.com>
 <esesb6dg5omj7e5sdnltnapuuzgmbdfmezcz6owsx2waqayc5q@36yhz4dmrxh6>
 <CAHj4cs874FivTdmw=VMJwTzzLFZWb4OKqvNGRN0R0O+Oiv4aYA@mail.gmail.com>
 <CAHj4cs_eOSafp0=cbwjNPR6X2342GF_cnUTcXf6RjrMnoOHSmQ@mail.gmail.com>
 <msec3wnqtvlsnfsw34uyrircyco3j3y7yb4gj75ofz5gnn57mg@qzcq5eumjwy5>
 <CAHj4cs-DC7QQH1W3KSzXS8ERMPW-6XQ9-w_Mzr1zEGF7ZZ=K3w@mail.gmail.com>
 <d6vi6aq44c4a7ekhck6zxxy4woa5q7v5bnvn5qmad7nqk7egms@ptc72tum4bks>
 <gngdj77k4picagsfdtiaa7gpgnup6fsgwzsltx6milmhegmjff@iax2n4wvrqye>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <gngdj77k4picagsfdtiaa7gpgnup6fsgwzsltx6milmhegmjff@iax2n4wvrqye>
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/3/18 13:47, Shinichiro Kawasaki via Linux-f2fs-devel
 wrote: > I confirmed that the trigger commit is dbf8e63f48af as Yi reported.
 I took a > look in the commit, but it looks fine to me. So I t [...] 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rmP80-0007vn-5k
Subject: Re: [f2fs-dev] [bug report]WARNING: CPU: 22 PID: 44011 at
 fs/iomap/iter.c:51 iomap_iter+0x32b observed with blktests zbd/010
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

On 2024/3/18 13:47, Shinichiro Kawasaki via Linux-f2fs-devel wrote:
> I confirmed that the trigger commit is dbf8e63f48af as Yi reported. I took a
> look in the commit, but it looks fine to me. So I thought the cause is not
> in the commit diff.
> 
> I found the WARN is printed when the f2fs is set up with multiple devices,
> and read requests are mapped to the very first block of the second device in the
> direct read path. In this case, f2fs_map_blocks() and f2fs_map_blocks_cached()
> modify map->m_pblk as the physical block address from each block device. It
> becomes zero when it is mapped to the first block of the device. However,
> f2fs_iomap_begin() assumes that map->m_pblk is the physical block address of the
> whole f2fs, across the all block devices. It compares map->m_pblk against
> NULL_ADDR == 0, then go into the unexpected branch and sets the invalid
> iomap->length. The WARN catches the invalid iomap->length.
> 
> This WARN is printed even for non-zoned block devices, by following steps.
> 
>   - Create two (non-zoned) null_blk devices memory backed with 128MB size each:
>     nullb0 and nullb1.
>   # mkfs.f2fs /dev/nullb0 -c /dev/nullb1
>   # mount -t f2fs /dev/nullb0 "${mount_dir}"
>   # dd if=/dev/zero of="${mount_dir}/test.dat" bs=1M count=192
>   # dd if="${mount_dir}/test.dat" of=/dev/null bs=1M count=192 iflag=direct
> 
> I created a fix candidate patch [1]. It modifies f2fs_iomap_begin() to handle
> map->m_pblk as the physical block address from each device start, not the
> address of whole f2fs. I confirmed it avoids the WARN.
> 
> But I'm not so sure if the fix is good enough. map->m_pblk has dual meanings.
> Sometimes it holds the physical block address of each device, and sometimes
> the address of the whole f2fs. I'm not sure what is the condition for
> map->m_pblk to have which meaning. I guess F2FS_GET_BLOCK_DIO flag is the
> condition, but f2fs_map_blocks_cached() does not ensure it.
> 
> Also, I noticed that map->m_pblk is referred to in other functions below, and
> not sure if they need the similar change as I did for f2fs_iomap_begin().
> 
>    f2fs_fiemap()
>    f2fs_read_single_page()
>    f2fs_bmap()
>    check_swap_activate()
> 
> I would like to hear advices from f2fs experts for the fix.
> 
> 
> [1]
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 26e317696b33..5232223a69e5 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1569,6 +1569,7 @@ static bool f2fs_map_blocks_cached(struct inode *inode,
>   		int bidx = f2fs_target_device_index(sbi, map->m_pblk);
>   		struct f2fs_dev_info *dev = &sbi->devs[bidx];
>   
> +		map->m_multidev_dio = true;
>   		map->m_bdev = dev->bdev;
>   		map->m_pblk -= dev->start_blk;
>   		map->m_len = min(map->m_len, dev->end_blk + 1 - map->m_pblk);
> @@ -4211,9 +4212,11 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
>   			    unsigned int flags, struct iomap *iomap,
>   			    struct iomap *srcmap)
>   {
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>   	struct f2fs_map_blocks map = {};
>   	pgoff_t next_pgofs = 0;
> -	int err;
> +	block_t pblk;
> +	int err, i;
>   
>   	map.m_lblk = bytes_to_blks(inode, offset);
>   	map.m_len = bytes_to_blks(inode, offset + length - 1) - map.m_lblk + 1;
> @@ -4239,12 +4242,17 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
>   	 * We should never see delalloc or compressed extents here based on
>   	 * prior flushing and checks.
>   	 */
> -	if (WARN_ON_ONCE(map.m_pblk == NEW_ADDR))
> +	pblk = map.m_pblk;
> +	if (map.m_multidev_dio && map.m_flags & F2FS_MAP_MAPPED)
> +		for (i = 0; i < sbi->s_ndevs; i++)
> +			if (FDEV(i).bdev == map.m_bdev)
> +				pblk += FDEV(i).start_blk;
> +	if (WARN_ON_ONCE(pblk == NEW_ADDR))
>   		return -EINVAL;
> -	if (WARN_ON_ONCE(map.m_pblk == COMPRESS_ADDR))
> +	if (WARN_ON_ONCE(pblk == COMPRESS_ADDR))
>   		return -EINVAL;

Shoudn't we check NEW_ADDR and COMPRESS_ADDR before multiple-device
block address conversion?

>   
> -	if (map.m_pblk != NULL_ADDR) {
> +	if (pblk != NULL_ADDR) {

How to distinguish NULL_ADDR and valid blkaddr 0? I guess it should
check F2FS_MAP_MAPPED flag first?

Thanks,

>   		iomap->length = blks_to_bytes(inode, map.m_len);
>   		iomap->type = IOMAP_MAPPED;
>   		iomap->flags |= IOMAP_F_MERGED;
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
