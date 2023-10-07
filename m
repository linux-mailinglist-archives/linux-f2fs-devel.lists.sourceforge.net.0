Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 562EE7BC513
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 Oct 2023 08:38:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qp0wk-0008Mv-NR;
	Sat, 07 Oct 2023 06:37:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qp0wh-0008Mp-RV
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 07 Oct 2023 06:37:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mQPelc3CKBU+9XuIeECX8NbsJvmYrmNfS8lvVTpFYXE=; b=AomYy1JOatChD6PA3RrdL1XM4q
 hBVofnaM04D0UAE3x24BR53Buov6rq4RaQm0gNqbHgGmwfFWLMIvAqTDWa8iIWcgjy02bGOUQi+MW
 KdLVDsR2QZuiOP/R3rmoxNneh7c+4ehjiEYuXXg6Z52yVP5pFPT1svGxIc+O3FAjg9NA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mQPelc3CKBU+9XuIeECX8NbsJvmYrmNfS8lvVTpFYXE=; b=AJziAWRqmStCYnXN3SQL3o8nHp
 ZQdU7h/bntKhkBjAdVXO9mSZbMv32RPDWSkWk0QRfHRy7uAlsxj26jeMwSMQ7cZVnShZJVGlIx3fp
 oFerMYUMxafLUjq2bV+mkoBJtd2M2fUk4vtCsV+mf9KjRPCaLw/dgU6kJjbRwMj1OGmg=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qp0wf-0007X2-P1 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 07 Oct 2023 06:37:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id ADC22B803F4;
 Sat,  7 Oct 2023 06:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ECD5C433C7;
 Sat,  7 Oct 2023 06:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696660658;
 bh=KSOrew3wseS+vBwOvbuWsGImKQGR9H+tyoy0Z79qIxY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VpiywC3o4HFOAQeLLKHx6ezYJX/OqNZR0whHK8AUlqUZcOcPGcsKShE7YmKGKLzl+
 AjI8+oqtE0G7WZbGe4ciaN3d+D7ry55pvoLNmA6xuz9hTnPdzj305JAlcxbfwoiJRB
 TTNu14qcH97j7vH02yN7hesuv46VGki7tmefSa5Q2+cwOkchrXm3ePAwfhr5/W5kuB
 no58BpfveTcEdTB1IsSYeATlJEy0dXDGZEBVFZU47OP1LSIq+VuQGGaP60bQ5tfgUN
 NCqJDEBbRHvUi9wBdgMDFz1CJTDkIyVjlfuA+CjhjyvpmJf4qxsV4BmkVxq2PVuzbn
 QSdQeXdvkzMig==
Message-ID: <3c154d90-f9ab-e0e9-dd49-d6880a45763f@kernel.org>
Date: Sat, 7 Oct 2023 14:37:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Wedson Almeida Filho <wedsonaf@gmail.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
References: <20230930050033.41174-1-wedsonaf@gmail.com>
 <20230930050033.41174-11-wedsonaf@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230930050033.41174-11-wedsonaf@gmail.com>
X-Spam-Score: -3.7 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/9/30 13:00,
 Wedson Almeida Filho wrote: > From: Wedson
 Almeida Filho <walmeida@microsoft.com> > > This makes it harder for accidental
 or malicious changes to > f2fs_xattr_handlers or f2fs_xatt [...] 
 Content analysis details:   (-3.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [145.40.68.75 listed in list.dnswl.org]
 -2.8 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qp0wf-0007X2-P1
Subject: Re: [f2fs-dev] [PATCH 10/29] f2fs: move f2fs_xattr_handlers and
 f2fs_xattr_handler_map to .rodata
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Wedson Almeida Filho <walmeida@microsoft.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/9/30 13:00, Wedson Almeida Filho wrote:
> From: Wedson Almeida Filho <walmeida@microsoft.com>
> 
> This makes it harder for accidental or malicious changes to
> f2fs_xattr_handlers or f2fs_xattr_handler_map at runtime.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Cc: Chao Yu <chao@kernel.org>
> Cc: linux-f2fs-devel@lists.sourceforge.net
> Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
