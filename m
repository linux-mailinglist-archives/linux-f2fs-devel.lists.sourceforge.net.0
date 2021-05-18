Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C6308387B71
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 May 2021 16:41:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nV9JikHxsUaC/beaXOhY4nw0FwxxFDLgfuGQ/zXBI8=; b=hrquyzkDQvKWOxi//uw7augYa9
	Wg0Vbi/ZkZz3+7785GRIsbM70kFLfnxmaWdFLFLHn8X/oMb6i1JMLHVWD4+iNfrQBG+IOOljU6Y5r
	xsgtNwc+DMrlM3me4eFEg97BORRi1caMYtVmWNgXYvKT8PzOpmGrAqxC93Ln59EW5k8o=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lj0ur-00014h-6X; Tue, 18 May 2021 14:41:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <elver@google.com>) id 1lj0uq-00014T-BG
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 May 2021 14:41:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+wL+2v0M/vNbXileTKiIKiGd46p3pZGmfkxwPNchYXI=; b=Oj+43AI13LjjD/fswUFitz4PQj
 okGmhIaQWec+n1iCiPqzwuyPQs8S9MY46Pt4rJA/KGQv0XQ4mc2/Vl3mFjhg5slY7Z2oVBQhN8MV3
 95rr+c7wFqZk6Uxwf1Kl17MAiC6clLuXafIBuYnAJM8ptum2F0HrbjDENBXkN/tE8EvE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+wL+2v0M/vNbXileTKiIKiGd46p3pZGmfkxwPNchYXI=; b=JjocoBYEpQNWgJ7jIVaoh76UsE
 aa5G6noxc4o55J4duqRz3oT2b+Q4kr571vJRz/g19L2SYenSb7fWnsNfUir4+Zl05E3IejevmesM2
 j5b5tw/TnKEVdilxfy9KcUlGhrxNr1qJJ0+Vugcv208ssB9kC00ysbl4anBbjVzLjBq0=;
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lj0up-00CljA-4D
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 May 2021 14:41:48 +0000
Received: by mail-ot1-f51.google.com with SMTP id
 g7-20020a9d12870000b0290328b1342b73so983061otg.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 18 May 2021 07:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+wL+2v0M/vNbXileTKiIKiGd46p3pZGmfkxwPNchYXI=;
 b=HZP+u1nq3armhATM7vYlr3S898E9NMIii8LPHjXGz/dtwZmIfrtiFEhY++b3BnBMDJ
 s2A1AeTwm8LVFtpj8+UaJp3LAdgbYELyc8I/Y6V6rv/u4EQM276LDbA4gXxdIIHYh5m4
 5GxpZLksBDL/c3KNFuGsFwMidRO/DbC3/TVS3e0b/eNoyP4upezS7l5VYOg4X4VZ6aVW
 hNEVeaZhuNP2kScEJChpSDV9+5b+YjnBxcjQLcNVuVpdgPO4En02T0hPxj3teOuA+vqB
 yZYjdT906dhvKZ+G+m1R0fO1nw0GLLfE5AwtzJqJZAO8Qu2t70L2zz+eiXew8KNV7Kqs
 iYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+wL+2v0M/vNbXileTKiIKiGd46p3pZGmfkxwPNchYXI=;
 b=k9mq5RldPNI43xHMWt62YXc3dwKfPVWJ4s9T7vohYa/1OdZIHkWnrcHJx1VVlM67IA
 8bmCRl1fBO/7WlFFVHMo+LNF0NHpTOzI59UV4O1pKgc8DJ10pyAw9BipQWaGbDV/7eNO
 8RNkMTa2m+KlzHYV6ZtHFy74dyXGYppc81nTWvs9/kThyqxkocjIzlLchTAuXHYimy/1
 IPnY49i9Z55wjdsKwf0co+AZcALDkzR1vaJ2hYVLpVeI0J9Kj2ink6fhAfI4ssmcyKrD
 FP+vT7Q/lOFMrHyfWLqP3cinsuXF8P6m0o0x69ZF2rDFzKfIj8/V3iSiwyyBsgWaUuHM
 wjGw==
X-Gm-Message-State: AOAM531jrgb1XE0lvLIzyE2CGL7dwZRj8+Au/Vb/sOC4nkndE1+RMtjy
 /IsU43zfH0NunW2Ejsv3UZB3eWuDpdQlZ+jGEDSPzQ==
X-Google-Smtp-Source: ABdhPJwbXsVUEMSFLRzDCWZ0OB5IgIKwbMCKuf5DQIhUZcrxB2BgDidhPVmoxUCxNOGeS24zAGQDQHAtmUwMID0NXCY=
X-Received: by 2002:a9d:1ea9:: with SMTP id n38mr4608528otn.233.1621348901293; 
 Tue, 18 May 2021 07:41:41 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000003f654905c168b09d@google.com>
 <CACT4Y+Zi_femntmu0qtUz1q1gbxs-0VNrLUULzY1bd+hrBngHA@mail.gmail.com>
 <CANpmjNPAKrwrqnsJHMmZTFZwZoTCPEj_DHZ1ecgMci3Pd8JjEg@mail.gmail.com>
 <8ca64b7f-efd4-0d4a-3235-0b2a4755d8d6@kernel.org>
In-Reply-To: <8ca64b7f-efd4-0d4a-3235-0b2a4755d8d6@kernel.org>
Date: Tue, 18 May 2021 16:41:29 +0200
Message-ID: <CANpmjNOXXt6HAYw9k-hwZvquTQW58hpbN4yzuujbwOuD3Q2p4g@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.51 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.51 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1lj0up-00CljA-4D
Subject: Re: [f2fs-dev] [syzbot] KFENCE: use-after-free in kmem_cache_destroy
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
From: Marco Elver via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Marco Elver <elver@google.com>
Cc: syzbot <syzbot+9d90dad32dd9727ed084@syzkaller.appspotmail.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 zhuangyi1@huawei.com, jaegeuk@kernel.org, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, 18 May 2021 at 16:26, Chao Yu <chao@kernel.org> wrote:
> Hi Macro,
>
> I've figured out a patch for this issue.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/?h=dev&id=cad83c968c2ebe97905f900326988ed37146c347

Ah, nice, thank you!
I wasn't sure if there had already been a fix, so I just wanted to follow up.

#syz fix: f2fs: fix to avoid racing on fsync_entry_slab by multi
filesystem instances

Thanks,
-- Marco


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
