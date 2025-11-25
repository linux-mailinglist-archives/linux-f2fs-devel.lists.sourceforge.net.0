Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0A8C8528C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Nov 2025 14:21:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwtLiA9H3Hey4jgG8bhdBk7ausrSxstct77Z92X7Spk=; b=asRQ4lOffQnvH0cJMDyqfRrkPp
	cQQMY64b+tN2enUYBVFOOW3X30lrDFhbaBPteNow4wmU/Pz0+H+PlQOBYgQFdXgXaiGDKyXLZsq6R
	G9X6AnR1E4ZyjQQgX+KiXzzs48h3tt4Pb99n+pepwjreyN9ek/9Mlzujv/xy3jjVJg0I=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNsz8-0004bS-SI;
	Tue, 25 Nov 2025 13:21:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <anuj1072538@gmail.com>) id 1vNsz7-0004bL-1v
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Nov 2025 13:21:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gm1y3HjSbfjetP2qj6SkQ/PvAerOiP935sq/jHQIUpg=; b=YH9QbjaW/MjA+vw7jYhcRVZ1Iq
 Y6961g2zpozb9zB2gylXfyOlKRk9Y/DORVIqRI1gRBSHoNwqumRyNGcFB8vVcYTrvhelfMY3+V1tq
 ywadhYRLnnGgwwHMM5icjM2AK/CJMpu6g6uRa8jSX+9kGy16FsDuPYBK3/zYjaagIiec=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gm1y3HjSbfjetP2qj6SkQ/PvAerOiP935sq/jHQIUpg=; b=kRwCDamesEpzckwGZBHLgMhwmM
 B7vYQeMdwqyONON4qJbbaHNsK5inCGq3nvHe0PT4dzjuEjOVjIkL1nXH8dhaPjGyj207wRRwHw8Nh
 v6J3mjxcE/YiDQYprAxoG1Zts3Efulp78zWU62tEXp/WO0n11PZXjN7FmAPuRXgXUgzU=;
Received: from mail-ed1-f41.google.com ([209.85.208.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vNsz6-0005ru-GH for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Nov 2025 13:21:32 +0000
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-6418b55f86dso9245822a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Nov 2025 05:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764076886; x=1764681686; darn=lists.sourceforge.net;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gm1y3HjSbfjetP2qj6SkQ/PvAerOiP935sq/jHQIUpg=;
 b=TJJbORkA9DRe5qzExC09koDKo62xlf8qxWprWGf6WhW/FHKtZ1HRn1idEHa7IkmLA9
 gW8NGsmAFI9ejQnXx28Uz3b8M5RjdJyrCqoQ+E2kb/SbtbIrOitn6jBnE7YvZQlQEfQA
 dF2zecWEhDne5Frr/XGMJY8eZubFcQWdoxV976+2aBTfRTGLfpQ9FXlv+vr/+tAJ5gUI
 OabvHtKkYSvqrtMQYnz5mT/xsom9vGbwcEDuOD3pvWTEcQKiuQIBO4WUwoJLcHF7zquW
 v2r88EQSuP6x6vnUl6vVYLfVta6LhyKNm6BpY+o8ZZvJU1trwknTBFoQvibfjn23YLXt
 hlxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764076886; x=1764681686;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gm1y3HjSbfjetP2qj6SkQ/PvAerOiP935sq/jHQIUpg=;
 b=Qd9odYDlW+2ZewzB5qZClWoLqICDtKNBhbbxWt0Lm5ZFAebSGIH+jxKLsbExqJLILq
 yj8aFt/Lh+9aby4a+N8HcBSOc27dq7RD+ksmyrQWip3OA6saHCscrUPijy1sBACUk6Ow
 tPhT3Kj4fU7ThxNtF9cXkDQwoNRX5Ok0G2NNMxcmb1pD4lIAmSZn8PwyaIvXN/3paSyg
 WFNcs4MtfTS1kXLjARk/r/RP5udPwzsUmOwYjv+g+DnzgwEWt17hgU74IVbYOIFSiqti
 M2mSTJ0inVCK0jKj7f0KJsZhMPrpPRCsYKcr4d/ETiqVAeEZrop69ljQjQwFPUrBet/o
 gCmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/jXJytkCfp/Rc9eeV3gKdbb+xCCxi8z2ah81my5FUOcnWfqofiURSpRh11DYRvN8mtiLUbIbRG9g2hmRMLj4H@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwBdKq0XfbuRwjJTlhEOuDFaZFMCFCQqrtbFQYR2rEy2ddlK7zg
 NcxgLawLW6599w1hsdevMQIT0VcDeGZVxEek1RSjTFwNe8phGe0Q5LDqlvzOsbbd3KK+mda6OUN
 gxicCPv+x5uIqlMsv3YXYa+SwnXsXbg==
X-Gm-Gg: ASbGncvCPSeKNEfX5mRgbDfbLSvC5k6GXYeuBJtPzkXicjfhIIF4ktdBkNnF7mOqgUY
 na//22bhB0LTmgDMWjchK2+oebUAfK96U2Ho2ldlm0lmiyAZmEu2eROeMhVEmPR09amOSDkrIHt
 +3aZ8afby/gd9nFHQgR/Ka8ppCNwh03Pkx0OX2s1tENJodRrI+MvOFd0z0ARxxXQg/e3vSCoyzq
 r2jyWLUa7PWu7TkHIvHDGJpdUvk5NNozgFGpLsnLoEdW3xpCvrw9vdiC+TSKJutse6DNVBPCLdY
 AM5NaXY3b4RhwPg1HPc7UFrPAgddW+zbF+8584NqfWcDBUgHfoJFPTecBA==
X-Google-Smtp-Source: AGHT+IFdAjUbTCRihlcnMQbRe3kaTpxY0zS2TJvPnabL+VI06FANQqQrLV6dY7bbefHQ9hiFBD+KK4yE+DNgNHPMVMo=
X-Received: by 2002:a05:6402:280c:b0:640:96fe:c7bb with SMTP id
 4fb4d7f45d1cf-6455469c726mr15216782a12.28.1764076885654; Tue, 25 Nov 2025
 05:21:25 -0800 (PST)
MIME-Version: 1.0
References: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
In-Reply-To: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
From: Anuj gupta <anuj1072538@gmail.com>
Date: Tue, 25 Nov 2025 18:50:46 +0530
X-Gm-Features: AWmQ_bmI0Nc-U-7V1vG_PnxUMzavwAZMXSjJQCtXVqm1t0YM1hU1mPKj8-N19OU
Message-ID: <CACzX3Avd95DD0g1ec5y3Rqhs6fpo0dqcKBScUr17AOHcw_2JhA@mail.gmail.com>
To: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Reviewed-by: Anuj Gupta 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [anuj1072538(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [anuj1072538(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.41 listed in wl.mailspike.net]
X-Headers-End: 1vNsz6-0005ru-GH
Subject: Re: [f2fs-dev] [PATCH V3 0/6] block: ignore
 __blkdev_issue_discard() ret value
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
Cc: axboe@kernel.dk, dm-devel@lists.linux.dev,
 linux-f2fs-devel@lists.sourceforge.net, kch@nvidia.com, sagi@grimberg.me,
 linux-xfs@vger.kernel.org, cem@kernel.org, snitzer@kernel.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-raid@vger.kernel.org, linux-block@vger.kernel.org, song@kernel.org,
 mpatocka@redhat.com, jaegeuk@kernel.org, bpf@vger.kernel.org, yukuai@fnnas.com,
 hch@lst.de, agk@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Reviewed-by: Anuj Gupta <anuj20.g@samsung.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
