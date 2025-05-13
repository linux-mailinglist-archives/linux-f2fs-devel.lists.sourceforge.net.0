Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A26AB58BE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 May 2025 17:36:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fEeesbKnu02aZ+UGMsSk1OP17Ystbdkb4zLnCsB20qU=; b=PzUXXUSErPhFLsbrXkY2OtnDjf
	Ph/ZMGumK4RTPcGwsaTsuRJP+H1RgslsMmsUQgQ2TyMWt9/QiJsE4VBJ7UgEmAnQMErJKFMqgjqFB
	7RFUw3sD7JrX8neK6/MUS+GzRIbtkjiBdyWk9ykyExx0wb4x4R/Rxk6XP1x+em6BlNSo=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uErgE-0000K8-Dl;
	Tue, 13 May 2025 15:36:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uErgD-0000Jy-6W
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 15:36:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Az7RkSjnlVg0OlMUhZPsNr6zqhJDBe/86j6PHsU4ZQE=; b=EHWjSfo08RbpxfQR9BnMKsZGV4
 xn/4oO+IpbSLoTocQDmgsfdqlhAB773MfMHGSXUScDsz3c1eS1facUYEIJvXQ7z8Eo0ZFOyn3MEFd
 8Mo0Ry2CZVId8g0b1NwxWb7B+XZC4aT2KE3SSIAqnDyXk3Av85ksC3FCl7evQn8X7Wi4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Az7RkSjnlVg0OlMUhZPsNr6zqhJDBe/86j6PHsU4ZQE=; b=efcmcHIMFIeU1GVdFxR/L6+CZQ
 jeCUuDLRf2poyPpD0x4jEDjKzTQihuBUwLbaql0cJg4vNS0MtL9TsEg+GIejFI7yIsgZvYWA4yWhQ
 QDRmahprJ/7eFNZAxpzyUHv2fvwhaje88NHjM0PDZGrvEsU3A/jeIVRa5bXXrssPbRKs=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uErgB-0007ot-R8 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 15:36:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 24075A4D859;
 Tue, 13 May 2025 15:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C53DC4CEE9;
 Tue, 13 May 2025 15:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747150581;
 bh=h0SueSLRMRwCJxCC2plmOq+6rDfK1UJPAlE3HaRh1B0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GMvVN74NU4eXkIncpamPk1rXO6UCCOOAE30o+R3Wr5hjj1UDJK3/PZT8I2LEFu8Az
 28nFQDVOA8HYw1vXatKyFdf953ssP+jtDnzh8EqqSZLqVIRXyb65DaMyUg4F3+GlVv
 hqd2ab+XZ4C3+XfR+i2BfQqSqIfmXSuYTwJuknSjMuTmUzYaGRB8Yflvy9pXKLZrZJ
 mk6KKhIJgs3SOlP0g2lwaPLaIShq61fKf7jQXe8bQIkvNIYD/qVvq7RdjYUzW5+q56
 gjT3iNtTOGPq6fxM6nw7EIjxukOKEAWb1uf/p4X+FJHkQY84EU984BGPV3bELdOMGd
 V+D6V5YSd7fpQ==
Date: Tue, 13 May 2025 15:36:19 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <aCNm858Rtt1ozdLp@google.com>
References: <20250423170926.76007-1-sandeen@redhat.com>
 <20250423170926.76007-8-sandeen@redhat.com>
 <b56964c2-ad30-4501-a7fd-1c0b41c407e9@kernel.org>
 <763bed71-1f44-4622-a9a0-d200f0418183@redhat.com>
 <74704f7c-135e-4614-b805-404da6195930@kernel.org>
 <3fe6be01-b9bf-4e26-b3f6-32dafe0a8162@redhat.com>
 <fb54f933-1669-4e89-8b85-9b88030a68d2@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fb54f933-1669-4e89-8b85-9b88030a68d2@kernel.org>
X-Spam-Score: -3.9 (---)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/13, Chao Yu wrote: > On 5/13/25 10:19, Eric Sandeen
 wrote: > > On 5/11/25 10:43 PM, Chao Yu wrote: > >> On 5/8/25 23:59, Eric
 Sandeen wrote: > >>> On 5/8/25 4:19 AM, Chao Yu wrote: > >>>>> @@ -2 [...]
 Content analysis details:   (-3.9 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uErgB-0007ot-R8
Subject: Re: [f2fs-dev] [PATCH V3 7/7] f2fs: switch to the new mount api
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Eric Sandeen <sandeen@redhat.com>, lihongbo22@huawei.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/13, Chao Yu wrote:
> On 5/13/25 10:19, Eric Sandeen wrote:
> > On 5/11/25 10:43 PM, Chao Yu wrote:
> >> On 5/8/25 23:59, Eric Sandeen wrote:
> >>> On 5/8/25 4:19 AM, Chao Yu wrote:
> >>>>> @@ -2645,21 +2603,11 @@ static int f2fs_remount(struct
> >>>>> super_block *sb, int *flags, char *data)
> >>>>>
> >>>>> default_options(sbi, true);
> >>>>>
> >>>>> -	memset(&fc, 0, sizeof(fc)); -	memset(&ctx, 0, sizeof(ctx)); 
> >>>>> -	fc.fs_private = &ctx; -	fc.purpose =
> >>>>> FS_CONTEXT_FOR_RECONFIGURE; - -	/* parse mount options */ -
> >>>>> err = parse_options(&fc, data); -	if (err) -		goto
> >>>>> restore_opts;
> >>>> There is a retry flow during f2fs_fill_super(), I intenionally
> >>>> inject a fault into f2fs_fill_super() to trigger the retry flow,
> >>>> it turns out that mount option may be missed w/ below testcase:
> >>>
> >>> I never did understand that retry logic (introduced in ed2e621a95d
> >>> long ago). What errors does it expect to be able to retry, with
> >>> success?
> >>
> >> IIRC, it will retry mount if there is recovery failure due to
> >> inconsistent metadata.
> > 
> > Sure, I just wonder what would cause inconsistent metadata to become consistent
> > after 1 retry ...
> 
> I don't remember, Jaegeuk, do you remember?

I remember, if the roll-forward recovery ended up with an error, we had better
retry mount() as we may have some online fixes.

> 
> Thanks,
> 
> > 
> >>>
> >>> Anyway ...
> >>>
> >>> Can you show me (as a patch) exactly what you did to trigger the
> >>> retry, just so we are looking at the same thing?
> >>
> >> You can try this?
> > 
> > Ok, thanks!
> > -Eric
> > 
> >> --- fs/f2fs/super.c | 6 ++++++ 1 file changed, 6 insertions(+)
> >>
> >> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c index
> >> 0ee783224953..10f0e66059f8 100644 --- a/fs/f2fs/super.c +++ b/fs/
> >> f2fs/super.c @@ -5066,6 +5066,12 @@ static int
> >> f2fs_fill_super(struct super_block *sb, struct fs_context *fc) goto
> >> reset_checkpoint; }
> >>
> >> +	if (retry_cnt) { +		err = -EIO; +		skip_recovery = true; +		goto
> >> free_meta; +	} + /* recover fsynced data */ if (!test_opt(sbi,
> >> DISABLE_ROLL_FORWARD) && !test_opt(sbi, NORECOVERY)) {
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
