Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E23C606C03
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Oct 2022 01:18:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oleoI-0006im-1K;
	Thu, 20 Oct 2022 23:18:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oleoG-0006if-Nf
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Oct 2022 23:18:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RgkoQ6roTMCkFcE9Uxx8thjvpApNnXmjlDk5qWKyrXU=; b=gWNADddDZ7l/0me5WXnNyo8ZfG
 VoYe9xDkSigkj1sisYBc0Oyh1SzzC+duMGaFJkH7W/UhQpe5EO+2qIFg0HIgMDCD4zPEz60OMfSrO
 zZ1EaW9KKggeAC6b8KiKgNZx6dGUhnoqUdzzjuZpncrlw5WprQSKfg78VOSefzdbcyyg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RgkoQ6roTMCkFcE9Uxx8thjvpApNnXmjlDk5qWKyrXU=; b=KCDXE9yRv/cnQmjPgXhHFbKNl1
 7do3aemjpy13lqG7vsJ8ROfl622e4C2tedNk6qx0e2kq3cU1OO42du8bHc8p3cu74nwgtbuad6BR7
 uDCTV8KiyeSWeeloHGYr4jbgbA8cwRPtG7iufMNBkTUfz2J0aamei6nfKRWemzwEWfJg=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oleoC-00BWdG-8k for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Oct 2022 23:18:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C6DD5B8298A;
 Thu, 20 Oct 2022 23:18:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78D8CC433D6;
 Thu, 20 Oct 2022 23:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666307905;
 bh=A7osocX1s8Gr10cRyR6XTcCz6uB2/y2xWeSb2WSn5VE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oW90rBv0CKC5uLVziLSlI4jBDDmysD78OFplhQDfnfnP1/SSGicK0rsnWjUmcgAqa
 NoBsjyfgY1OAGmdNEpdrpcG1TRGtSM1muuKBqQBT9Kqsa3pYnrWH20RDkIDHFklf9N
 uOeVF0dvdGhr57wetTKuywkDRfI3sLn5W5sK4tzJwp6E/BeGnfPhTxj38E9udd7u1z
 0y9qBJPOZ1eKiUrKWMnXRVfIRFzP+zeHyRrDlJYytagsbKkDFgAyu6EJ7m5u06Tyjo
 dRrHoiRC2mDkAuUHxKGCpCmZuSm+cX4E51ZtJWepDR9KblnZiOwjwLV1o8WXRccsMB
 eEOHuKJSrmgoA==
Date: Thu, 20 Oct 2022 16:18:23 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Message-ID: <Y1HXP7ysrNXX+oR8@google.com>
References: <20221010221548.2728860-1-jaegeuk@kernel.org>
 <20221020090708.tiysx3qsgatb3ngv@shindev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221020090708.tiysx3qsgatb3ngv@shindev>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/20, Shinichiro Kawasaki wrote: > On Oct 10,
 2022 / 15:15, 
 Jaegeuk Kim wrote: > > As f2fs becomes more resilient for GCs, let's give
 the marginal overprovision > > space back to user. > > > > Sig [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oleoC-00BWdG-8k
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs-tools: give less overprovisioning
 space
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/20, Shinichiro Kawasaki wrote:
> On Oct 10, 2022 / 15:15, Jaegeuk Kim wrote:
> > As f2fs becomes more resilient for GCs, let's give the marginal overprovision
> > space back to user.
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> 
> Hello Jaegeuk,
> 
> Using the dev branch of f2fs-tools repo, I observed mkfs.f2fs failure with zoned
> block devices:
> 
>         Error: Device size is not sufficient for F2FS volume
> 
> I found this patch in the branch triggers it. I also observed the same failure
> is observed with non- zoned regular block devices when I specify -s options to
> mkfs.f2fs command. With these conditions, number of segments in each section is
> not zero, and it increases the number of reserved segments. My understanding is
> that it makes reserved segments larger than overprovisioning segments all the
> time in the loop of get_best_overprovision(). Then get_best_overprovision()
> returns 0% overprovisioning ratio. Hence the error.
> 
> Could you take a look for fix?

Thanks, I think that fix looks good to me. I applied into the original patch.
https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?h=dev&id=281d3e72370f6c39c0d57acaf37a7f0e003ddd28

> 
> FYI, I tried to fix and created a patch which allows reserved segments larger
> than overprovisioning segments [1]. It compares those two, and take larger one
> to subtract from usable segments to get the segments for users. I confirmed it
> keeps small number of overprovisioning segments for no -s option case, and
> avoids the mkfs.f2fs failure for the -s option and zoned block device cases.
> However, it increases runtime of my test script which fills f2fs and do file
> overwrites to test f2fs GC on zoned block devices. It takes +60% longer runtime.
> Then GC performance looks worse than before, and this fix does not look good
> for me.

I think you can try to avoid that by tuning /sys/fs/f2fs/xx/reserved_blocks?

> 
> [1]
> 
> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> index 8ca574a..4902953 100644
> --- a/include/f2fs_fs.h
> +++ b/include/f2fs_fs.h
> @@ -1634,9 +1634,10 @@ static inline double get_best_overprovision(struct f2fs_super_block *sb)
>  		reserved = (100 / candidate + 1 + NR_CURSEG_TYPE) *
>  				round_up(usable_main_segs, get_sb(section_count));
>  		ovp = (usable_main_segs - reserved) * candidate / 100;
> -		if (reserved >= ovp)
> +		if (ovp < 0)
>  			continue;
> -		space = usable_main_segs - ovp;
> +
> +		space = usable_main_segs - max(reserved, ovp);
>  		if (max_space < space) {
>  			max_space = space;
>  			max_ovp = candidate;
> diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
> index c314d1c..08f4e66 100644
> --- a/mkfs/f2fs_format.c
> +++ b/mkfs/f2fs_format.c
> @@ -764,11 +764,8 @@ static int f2fs_write_check_point_pack(void)
>  	set_cp(overprov_segment_count, (f2fs_get_usable_segments(sb) -
>  			get_cp(rsvd_segment_count)) *
>  			c.overprovision / 100);
> -
> -	if (get_cp(rsvd_segment_count) > get_cp(overprov_segment_count)) {
> -		MSG(0, "\tError: Wrong overprovision ratio\n");
> -		goto free_cp_payload;
> -	}
> +	if (get_cp(overprov_segment_count) < get_cp(rsvd_segment_count))
> +		set_cp(overprov_segment_count, get_cp(rsvd_segment_count));
>  
>  	if (f2fs_get_usable_segments(sb) <= get_cp(overprov_segment_count)) {
>  		MSG(0, "\tError: Not enough segments to create F2FS Volume\n");
> 
> -- 
> Shin'ichiro Kawasaki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
