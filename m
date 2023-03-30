Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B63146CF998
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Mar 2023 05:31:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1phj0R-0000Wa-J0;
	Thu, 30 Mar 2023 03:31:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1phj0O-0000WT-RC
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Mar 2023 03:31:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8jCOC6JvhBsx7v7Yl1WIz9WMuaygOee6Axz8NAeZZ9E=; b=X/pphLmZoCwlIYkjsMT9uE0Dbm
 nDruu9mE+8FUpfLNNVDlgdaopiRe2g+FxktANlYTeZpOD1NB95GHxl4WCOyZ7rRFm40bAuoKnjPd6
 PtJtJejNIvnXXT8HbcPiMqlKkLM21BkKipdkAlb0iaymH0OTCxQTo5rpvSP90qv0dXj4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8jCOC6JvhBsx7v7Yl1WIz9WMuaygOee6Axz8NAeZZ9E=; b=QW7vO4COgTJjBRXAQLZvt+GtMz
 Cp7S1eBA7ItQfJlvQLNxTmQHyD/DKf3Yzav9aUs1TEEmzzZxOfIvWyc1ktpDuuB/C41XL4Wj3FlnT
 E+sIbkWVA+4W7NiYbjwOMB3zQJIObXQ15xJG/RekFKD/y1wHC3U5E16KFLe2QigWdJPM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1phj0K-0095Gi-Jv for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Mar 2023 03:31:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 97BA561EBE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 Mar 2023 03:31:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0D88C4339B;
 Thu, 30 Mar 2023 03:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680147065;
 bh=igyCewIUz82gH7CzSCMDY/x806RyZvh2vtHMLHGuekk=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=iH5+7VviNWXrP8ZrAiDkZ4dEO0086FLL9MjVN81RIWRTlo/nulAL8Pqzu17RMSdkw
 jGjIpc4eZiA8pHeb6aSUhrwWOr5FvwJ7AyzkLU8bp+dvijSKvJgN4QODfiXiYQ8Mo5
 obozvFqcWsFJNdUF+nbWjCtSegcTpMVqQjovJC7nwxeztqyHgZr0Kf0cTQOXJ7zNJy
 i8IGaieZ1CVRflOy+NrGHKRej433Q6Kim23s1Mwrkqz2P+0fazG7D6+Yi2iaWpY/eN
 oCAubc2o2PB/pjL1jlFN0E4yWRCR1mKjLSLifvIouqMcRzKQHTi0OkYSrTCpSSa7KB
 PSRhMk+VYsuxA==
Message-ID: <3afe98f8-49df-55c8-db37-74d11cb39a7b@kernel.org>
Date: Thu, 30 Mar 2023 11:31:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
To: bugzilla-daemon@kernel.org, linux-f2fs-devel@lists.sourceforge.net
References: <bug-217266-202145@https.bugzilla.kernel.org/>
 <bug-217266-202145-lBYEimIUNZ@https.bugzilla.kernel.org/>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <bug-217266-202145-lBYEimIUNZ@https.bugzilla.kernel.org/>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/3/30 10:48,
 bugzilla-daemon@kernel.org wrote: >
 https://bugzilla.kernel.org/show_bug.cgi?id=217266
 > > --- Comment #2 from shilka (shilkazx@gmail.com) --- > (In reply to
 michalechner92 from co [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1phj0K-0095Gi-Jv
Subject: Re: [f2fs-dev] [Bug 217266] kernel panic on f2fs filesystem when
 f2fs_commit_atomic_write
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

On 2023/3/30 10:48, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=217266
> 
> --- Comment #2 from shilka (shilkazx@gmail.com) ---
> (In reply to michalechner92 from comment #1)
>> That looks identical to what I reported last week here:
>>
>> https://sourceforge.net/p/linux-f2fs/mailman/message/37794257/

Could you please have a try w/ below patch?

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a46bebd502fe1a3bd1d22f64cedd93e7e7702693

>>
>>
> 
> Yep, it seems very similar, but I do not encounter this problem until update to
> kernel 6.2.8.
> Before I saw your reply, I guess there might exist some subtle conflicts
> between new feature in 6.2.8 kernel and the f2fs module. With your info, it is
> highly possible that the implementation of f2fs exists some bug, and new kernel
> feature might frequently trigger it.
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
