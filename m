Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E4C8A0BB6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Apr 2024 10:57:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ruqF4-0003fP-Pj;
	Thu, 11 Apr 2024 08:57:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ruqEz-0003dI-H9
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Apr 2024 08:57:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lwxb9/tP9Rn3AGMWrCZb1HPfLLAsZL4M0SeWIosH2J0=; b=EURSyFkN+j8jOSlLj76H6LcOc9
 ABianJTK6/av4F+5GAO8Vw4PYm4/2OgDyXNdRQkA3ZviV+Yh6Gys5trxZa8DqKx3OnaqvQS0niWFH
 brLdo+mmqVJMaC3lMu2OVCpj2A+XKAbzvz2MLCsqqiF5zZj3vtXPBc3tlecXjaQJ5cho=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lwxb9/tP9Rn3AGMWrCZb1HPfLLAsZL4M0SeWIosH2J0=; b=UIl54Z2GErzaBJtWy3nhc1TWSw
 Fs4INPJxoKgZAbeeCeaV/R2ieksyuWZ8zioUrFTI2MS8kSHoXH/mFuIvGt6mwgOR9MacBo2MB74LB
 6v3eJmhgE0PeXqcYDZoVnwhtfSwmhHDlslJIXbZgoBarW3RUVSax8eSYOY1HQS24y2Lw=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ruqEy-0007U8-Qc for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Apr 2024 08:57:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4DBE4CE2F99
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 11 Apr 2024 08:56:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2716C433C7;
 Thu, 11 Apr 2024 08:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712825812;
 bh=MiTIYvye3l6B9JzrY4Ir5pDljWirVEULk0X8LUFTE64=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=Ni5naDon9oxkiHHp2T5IHrRod+YcAco5n2SMcDPM0jghA5h2oHI+JQQ3ysuBQTbuZ
 Xj+YvoAcDr1ogQCHPscSuPsW/MOnwJcsekgmyCMA8+i3rNTHt6ptI/zcp1ig7qf4h9
 W26M+qYR209yH8FdAFu3n62hxembeYtw2fhWPM4atHELh74zpSurHAFmr5YzKk82TK
 dXt9w23gEg9nDpHvxysZcIECw9YjRfX2aLB3ePJf+tt6WY0lZvQNT2RKW+TzBYKPB7
 Ga7iO1FPJu7OjbcrwhQvWSjR/X672lNQE+lGjjAZ15JVCrjL37tCQrAwtVVtiqyH+r
 KKbU4JOa6CiiQ==
Message-ID: <27380aa8-4a80-48cc-b4ef-9fe08fe3de82@kernel.org>
Date: Thu, 11 Apr 2024 16:56:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20240409203411.1885121-1-jaegeuk@kernel.org>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240409203411.1885121-1-jaegeuk@kernel.org>
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/4/10 4:34,
 Jaegeuk Kim wrote: > Let's convert PageWriteback
 to folio_test_writeback. > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
 Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ruqEy-0007U8-Qc
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs: use folio_test_writeback
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

On 2024/4/10 4:34, Jaegeuk Kim wrote:
> Let's convert PageWriteback to folio_test_writeback.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
