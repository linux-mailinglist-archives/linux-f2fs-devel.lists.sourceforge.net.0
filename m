Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ACE61979
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 Jul 2019 05:21:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BGDeY+zlLSp7GS4w+VT/28nHkIC/JX6Vt25ofV9Y5xg=; b=CPjdQiR4Dug4S/0/kntQHruSl
	wEn6jkPhtuy0TF0EslLwR4GSC1Xr50ZjLmha8Frt/8YqZxolsNxCjt5mhmaRVXSpXB3qziVREWT3S
	18ExVvFIs3gE4xGTVJ9Ilcg9y1Fx+lz4bN1HqT3mz7V+w9cDi/O/AVmHudL2labaDKmjU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hkKDO-00022k-O6; Mon, 08 Jul 2019 03:21:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <oceanchen@google.com>) id 1hkKDN-00022d-LG
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Jul 2019 03:21:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yriNKsJYe60EiNop3TWpMryY2FxcQ0ThW6Sm/XJwlR8=; b=Oc09embVz/jy8LWurOwFWKLQpu
 mdAMxxGNIR67LlhKXxZJfOgfREIA1o+tSXKaU9TgNuCX9ICLHHgstyzQHOmBLxJMhB5uVsiyWMYCq
 bkJo3z2kic0DW0WmLjG51PJfIjCD29opQuTRIxJP/fZZzDuQxiUwU3MwshCUADEEYTKc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yriNKsJYe60EiNop3TWpMryY2FxcQ0ThW6Sm/XJwlR8=; b=TlKnp6Q6G2A7i0NfYaSnAYB2KU
 OvhB3ZB6udlJ0lWPQvBh8m2I4DD3jJPuq75YfONUqn8tPzGnwCWBkC+Gb2t4WuPotiot7PrhP2Xr9
 v7JYBYYFlWPsG6KNRdlwZ6rjYKeNQUvrR04mdo5o6GBaRPKQ7l9GJ2nvf8iNiHy23SYc=;
Received: from mail-pl1-f193.google.com ([209.85.214.193])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hkKDW-00AuR1-Ro
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Jul 2019 03:21:30 +0000
Received: by mail-pl1-f193.google.com with SMTP id b7so7495895pls.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 07 Jul 2019 20:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yriNKsJYe60EiNop3TWpMryY2FxcQ0ThW6Sm/XJwlR8=;
 b=EjuZ1ANbtWBdFoLUBhJy9NtMg1EBYm4JHMHrGolEeqgphFf/tPZ52cOdUyqWITuNVo
 SIwGW+m80mSfKEHOxu72UX1mqNLUffbdTxTux4L0WTdT6xtq+8Mso7YqAS1onxOwcrTU
 BTxCSxzp5soMmiH+XApJ/ROmWhsX99p/B46sXTR/1SIJOYZRu0C4hQxojEm7laFCffyD
 nCLvrrLDCza0BlqijaL2JnzpdvQGL+aAj8AdPQbo7rOs+0v9ucBbeaQsydsCGXX3lP+a
 c4bXY0l7ULFAVwiEjbqU6Ft0u6Wg6L6VXRjiOSTsmOVejix0h4h01hqZ97SHMz3KT2+L
 eEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yriNKsJYe60EiNop3TWpMryY2FxcQ0ThW6Sm/XJwlR8=;
 b=iTESo9AmzL/Rnn/vroi+EAlJf+T2T7XKkGT3BfePTqL0rAVCfxlyJVaokyVU6EuyDp
 ZIr5KHDEI7x6i2slbBNBXIeh/eBeVmRHo7c5zN56O76JY7ShlVorTfj3SC0gd1t0Obmz
 kebCFbyv/+CfZFtrGaM4I30Pp3T3cxyxs6709XtDnU6o+XKvSSqxPSvXX31BbDQOI9dI
 zqOOSQKW+WtLccMhu7vHnS494GxWgrD3DP7zVSfElJWNGctzPTZqu0ciPdp9L81C/qU/
 yVAFoMvekrrI2h3uVGf+W6owj1o+FqTgJyjOd75jdHvt22ZcXXj1gYAQV05+MfsQFnl5
 85Xw==
X-Gm-Message-State: APjAAAXNi/z2uY4IaconhBq7zVg0DPTLtOk6xGCR+OuqM0U9i3sydWEI
 tVhQ+otM97nih1P55CGe6fLIWg==
X-Google-Smtp-Source: APXvYqy9tBhinJ/jH5hpam8xPIBRos92/McvenDYvqMZ3bPkT9zPSd6TglCFr+WR+TOqD/5Mar2odg==
X-Received: by 2002:a17:902:2a27:: with SMTP id
 i36mr21205885plb.161.1562556079749; 
 Sun, 07 Jul 2019 20:21:19 -0700 (PDT)
Received: from google.com ([2401:fa00:fd:2:3217:6d96:9ca7:b98b])
 by smtp.gmail.com with ESMTPSA id r1sm17346719pfq.100.2019.07.07.20.21.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 07 Jul 2019 20:21:19 -0700 (PDT)
Date: Mon, 8 Jul 2019 11:21:11 +0800
To: yuchao0@huawei.com, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Message-ID: <20190708032111.GA189070@google.com>
References: <20190702080503.175149-1-oceanchen@google.com>
 <cfcd3737-3b03-87fe-39e8-566e545cab3a@huawei.com>
 <20190703150355.GA182283@google.com>
 <65e4ad7b-ffbc-d5c9-9a0f-0532f4c4f5a9@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <65e4ad7b-ffbc-d5c9-9a0f-0532f4c4f5a9@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -11.4 (-----------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 3.2 FSL_HELO_FAKE          No description available.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.193 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 1.3 PDS_NO_HELO_DNS        High profile HELO but no A record
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hkKDW-00AuR1-Ro
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: avoid out-of-range memory access
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
From: Ocean Chen via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Ocean Chen <oceanchen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi YuChao,

  Yes, we got externel researcher reports this security vulnerability.

And dump info is better when blk_off is invalid. I'll prepare the next
patch for it.

On Thu, Jul 04, 2019 at 03:11:27PM +0800, Chao Yu wrote:
> Hi Ocean,
> 
> On 2019/7/3 23:03, Ocean Chen wrote:
> > Hi Yu Chao,
> > 
> > The cur_data_segno only was checked in mount process. In terms of
> > security concern, it's better to check value before using it. I know the
> 
> Could you explain more about security concern.. Do you get any report from user
> or tools that complaining f2fs issue/codes?
> 
> I'm not against sanity check for basic core data of filesystem in run-time, but,
> in order to troubleshoot root cause of this issue we can trigger panic directly
> to dump more info under F2FS_CHECK_FS macro.
> 
> So, maybe we can change as below?
> 
> blk_off = le16_to_cpu(ckpt->cur_data_blkoff[i]);
> +if (blk_off > ENTRIES_IN_SUM) {
> +	f2fs_bug_on(1);
> +	f2fs_put_page(page, 1);
> +	return -EFAULT;
> +}
> 
> Thanks,
> 
> > risk is low. IMHO, it can be safer.
> > BTW, I found we can only check blk_off before for loop instead of
> > checking 'j' in each iteratoin.
> > 
> > On Wed, Jul 03, 2019 at 10:07:11AM +0800, Chao Yu wrote:
> >> Hi Ocean,
> >>
> >> If filesystem is corrupted, it should fail mount due to below check in
> >> f2fs_sanity_check_ckpt(), so we are safe in read_compacted_summaries() to access
> >> entries[0,blk_off], right?
> >>
> >> 	for (i = 0; i < NR_CURSEG_DATA_TYPE; i++) {
> >> 		if (le32_to_cpu(ckpt->cur_data_segno[i]) >= main_segs ||
> >> 			le16_to_cpu(ckpt->cur_data_blkoff[i]) >= blocks_per_seg)
> >> 			return 1;
> >>
> >> Thanks,
> >>
> >> On 2019/7/2 16:05, Ocean Chen wrote:
> >>> blk_off might over 512 due to fs corrupt.
> >>> Use ENTRIES_IN_SUM to protect invalid memory access.
> >>>
> >>> v2:
> >>> - fix typo
> >>> Signed-off-by: Ocean Chen <oceanchen@google.com>
> >>> ---
> >>>  fs/f2fs/segment.c | 2 ++
> >>>  1 file changed, 2 insertions(+)
> >>>
> >>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> >>> index 8dee063c833f..a5e8af0bd62e 100644
> >>> --- a/fs/f2fs/segment.c
> >>> +++ b/fs/f2fs/segment.c
> >>> @@ -3403,6 +3403,8 @@ static int read_compacted_summaries(struct f2fs_sb_info *sbi)
> >>>  
> >>>  		for (j = 0; j < blk_off; j++) {
> >>>  			struct f2fs_summary *s;
> >>> +			if (j >= ENTRIES_IN_SUM)
> >>> +				return -EFAULT;
> >>>  			s = (struct f2fs_summary *)(kaddr + offset);
> >>>  			seg_i->sum_blk->entries[j] = *s;
> >>>  			offset += SUMMARY_SIZE;
> >>>
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
