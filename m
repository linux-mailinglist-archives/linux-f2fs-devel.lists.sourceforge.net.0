Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D17E7D7F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2019 01:27:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yh4iNxc3DIWgOA2eqLghKS9IFPCteQyEn17N/XG/ako=; b=VOzjm9sR7Mpx+STo7FW9Q0JDIq
	7R2cdIm9FtSoO2w+pAtfYt6/Wq9pgHyr9qiO0ST9W0h+q2nr1/iM+npd/VCFblp6wTuIYypWGbAlo
	TITYAmZwR1VmkT2SH8yGBCrGytRvWvq9cjvR0LAX71InEAHoui5CkImKS7rosaMftTjA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iPFMA-0006wB-Us; Tue, 29 Oct 2019 00:27:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hridya@google.com>) id 1iPFMA-0006w4-5p
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Oct 2019 00:27:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EFG/NUMsi6FfdyRZ+1e8lH7DWnn/2sbhoHTkW1LTspQ=; b=lr3LtW1fLG9Rsdth9v3RkQ/dxg
 nsRNUJPhvTue6hv0zBvGM+7n8FP7MyBkCg46kTEOutYcdVUBsAgKujLqhOY7/pOQFwobJYRUWPrB2
 VEodJu+ndcaO11encyf472ek2HMcgtd8q6AWFdJaO7tpWCo2pCarEr8cFxxioG0V+7/4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EFG/NUMsi6FfdyRZ+1e8lH7DWnn/2sbhoHTkW1LTspQ=; b=Y1gZZMONbcnpMUN71B+aORD0ih
 XCJ5xAo2ehfDsb/bizn5OLVLUwJ2d0Bum92wew0dpCl8z+otZ1y0YrrufhgonkZsDLGrXvN8WPWSP
 teKQ7YGPBZ8u6BGCzFDq7YM3o1C3R1Wi9auZjkUUAqjkYoyhBGo6DffJ9bECVCJiHa44=;
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iPFM8-004lkS-Of
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Oct 2019 00:27:30 +0000
Received: by mail-ot1-f67.google.com with SMTP id b19so5934225otq.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Oct 2019 17:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EFG/NUMsi6FfdyRZ+1e8lH7DWnn/2sbhoHTkW1LTspQ=;
 b=N549/5eirfYiMcEkpgmhVSSpEyVRHSOgPEz645xTJulyOKXBFmbS+kttzA1bI4775t
 KEB4cnQ8CSDgEaf3xORF5wcjxQN4e+EJo3f0Vm0GOg/j+Ahj2Dk1sSIozG/tGExY4mmZ
 KhHByJXLiNKUABr8oFs+9R4n4hLJs7TWoSpR0lCSSWO8XFfPKqYjYdevQPekSBIPqxA3
 HvsjCa7jokmArh/ClM6pBzyipGOeaECa9E50bk2n6MCgYC8hn9dVW/OmmX25MFTC7gjG
 xTo47H1OBR74DUU0lbosTDLdnRM84NtxVrWeadlk+AwZH22SaGHJUA/R32VBcK01dqt0
 VAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EFG/NUMsi6FfdyRZ+1e8lH7DWnn/2sbhoHTkW1LTspQ=;
 b=J1HeIaK8NnvxnOU2KYk60q59159+ys5o8llQIDMQZJdIMhAlvvHGc6rQs3EipnVJwk
 7/pe9bLrsnAX6E6qKJsAVdpMmDTs7cKqRe0bklrlZFr/PzYkfF2SCdpzs+1rjTe8i49/
 uyS38wsTz6Tzcq9uRwZ6c0jz/NDC7AeYS7eyAsqV6VS5JqrqLHpVImaQppiSRS/WEB2r
 JJmhrAB/tZ1mzOy52S8llz0sRRWpUqmKi3LaxwHpvUn3siSVRwvARuFc64QJWZwN5eI0
 sT3cOS+0LF9JQ5DxkoSQSSTGmDDMc5+CY3pLglCMScAs3xnk18KGxELJanlqX0tcVcjv
 2j1Q==
X-Gm-Message-State: APjAAAUO5E4mXpa6vll4ZRqs8c9spCqIhohUhn1SOGIW9BwtwPNa5YEG
 gGHYeq3DIqEUAKFCKUJzPrw3QG31ahK9DYgSyEtbSw==
X-Google-Smtp-Source: APXvYqyyMmC6akibUD0ctyx6cZAI+MIQu4fGSJOdVD9ulOLlox6OONUlRS6Dqd0X3Ff0CgmITcC9+WmmkjuDol9LmWE=
X-Received: by 2002:a05:6830:1bea:: with SMTP id
 k10mr11448680otb.190.1572308842618; 
 Mon, 28 Oct 2019 17:27:22 -0700 (PDT)
MIME-Version: 1.0
References: <20191023214821.107615-1-hridya@google.com>
 <20191023214821.107615-2-hridya@google.com>
 <e61510b8-c8d7-349f-b297-9df367c26a9f@huawei.com>
 <CA+wgaPNas7ixNtepJE_6e7b6Dcutb9a1Who4WrUfKSw1ZnQhTA@mail.gmail.com>
 <96f89e7c-d91e-e263-99f7-16998cc443a7@huawei.com>
 <20191025182229.GB24183@jaegeuk-macbookpro.roam.corp.google.com>
 <eb08716f-2f56-30bb-d71d-28125b3b0608@huawei.com>
In-Reply-To: <eb08716f-2f56-30bb-d71d-28125b3b0608@huawei.com>
Date: Mon, 28 Oct 2019 17:26:46 -0700
Message-ID: <CA+wgaPMcJWqwiQwt9z0+C5AFMbAB7wSuNeE9wvp3PDOYF_6kew@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.67 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
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
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1iPFM8-004lkS-Of
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: Add f2fs stats to sysfs
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
From: Hridya Valsaraju via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Hridya Valsaraju <hridya@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
 Android Kernel Team <kernel-team@android.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Oct 25, 2019 at 6:38 PM Chao Yu <yuchao0@huawei.com> wrote:
>
> On 2019/10/26 2:22, Jaegeuk Kim wrote:
> > On 10/25, Chao Yu wrote:
> >> On 2019/10/25 11:51, Hridya Valsaraju wrote:
> >>> On Thu, Oct 24, 2019 at 2:26 AM Chao Yu <yuchao0@huawei.com> wrote:
> >>>>
> >>>> On 2019/10/24 5:48, Hridya Valsaraju wrote:
> >>>>> Currently f2fs stats are only available from /d/f2fs/status. This patch
> >>>>> adds some of the f2fs stats to sysfs so that they are accessible even
> >>>>> when debugfs is not mounted.
> >>>>
> >>>> Why don't we mount debugfs first?
> >>>
> >>> Thank you for taking a look at the patch Chao. We will not be mounting
> >>> debugfs for security reasons.
> >>
> >> Hi, Hridya,
> >>
> >> May I ask is there any use case for those new entries?
> >>
> >> So many sysfs entries exist, if there is real use case, how about backuping
> >> entire /d/f2fs/status entry into /proc/fs/f2fs/<dev>/ directory rather than
> >> adding some of stats as a single entry in sysfs directory?
> >
> > These will be useful to keep a track on f2fs health status by one value
> > per entry, which doesn't require user-land parsing stuff. Of course, Android
> > can exploit them by IdleMaint, rollback feature, and so on.
>
> Alright, I suggest to add a sub-directory for those statistic entries, we can
> manage them more easily isolated from those existed switch entries.

Thank you Chao and Jaegeuk. I will make this change and send out a new version.

Regards,
Hridya

>
> Thanks,
>
> >
> >>
> >> Thanks,
> >>
> >>>
> >>> Regards,
> >>> Hridya
> >>>
> >>>>
> >>>> Thanks,
> >>> .
> >>>
> > .
> >


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
