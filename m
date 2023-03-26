Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 823FD6C949B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 26 Mar 2023 15:50:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pgQkz-0005t7-Vg;
	Sun, 26 Mar 2023 13:50:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pgQkw-0005t1-Ki
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 26 Mar 2023 13:49:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C/PLvzD8RSWpsnRBqcXlxbiX4+dIwDLvRo2aNxelbg0=; b=CYNTTALUxoxt7A+d9nYKir1Red
 FCs82Aout1h7dTkCidrWl6wFvJ0B8mU5tg8eJx1bRQGa4jtQYiX7tLsr6Ap+1Tq2SkptfPScAePDE
 5aDQ/zXK44J1++gVkUJIyl/qnZfsYZfGo+jMU1ZNFo3PLNgNHkj9GUKTJaxSVfHf5X4A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C/PLvzD8RSWpsnRBqcXlxbiX4+dIwDLvRo2aNxelbg0=; b=GVaplD9ZYPOpyAqlcGf847Xlaf
 ZoI0sI+oOoCZbMZEbsFvNeKcfSppf1+uKjajK/kWt/D/KD6MdFXDWeMgFXQFLRYn2S1D+AXJdAEX+
 dFKblMswo9QPs9als6Mko43l+fKWlQvN0xnGbdrrkr50QTqOwCc/ewLqRWRczj8EStv0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pgQkq-000494-Hz for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 26 Mar 2023 13:49:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2C79D60E9B;
 Sun, 26 Mar 2023 13:49:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE25C433EF;
 Sun, 26 Mar 2023 13:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679838586;
 bh=6fOgTWzVrss+rb+Gr+qQbntTVt0XT8KX+kHdAaZ3HtA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GzYRuNnqfoW++B4B/A0ZPhpUmdgvLw5ZhY0SbxrabINuECe6frEtW96QLgDaiUzyg
 Ocq/5SIw7PUrv/wdsWvkpjzisy4OXh7JUCecBDV0etbW87rGWA+YAEhJ2NoqWBCU3S
 7m/LDuyXbInDb7HZXAp40QksPSz+1peE2UCSRWE7k4Kqn1uPqabuUF0wFSDzrQLCrg
 r4un2ChuAZl4l9e2+iFQipLONsU2sMr6yzpGoMYFIUKIZhXGxqPBRElHN5XGS4aZYk
 v75TlMqD6ir+Y7m+PaX+WslflEcknBYfwIQm0bj8E5SYHU3SO2Ui7bQXw7qptkkP0S
 38ML2h2UtttnA==
Message-ID: <7cb351fa-1f93-6acc-a64d-1107d7e9f032@kernel.org>
Date: Sun, 26 Mar 2023 21:49:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230320173137.64413-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230320173137.64413-1-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/3/21 1:31, Yangtao Li wrote: > As Christoph Hellwig
 point out: > > Please avoid the else by doing the goto in the branch. > >
 Signed-off-by: Yangtao Li <frank.li@vivo.com> Reviewed-by: Chao Yu
 <chao@kernel.org>
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pgQkq-000494-Hz
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove else in f2fs_write_cache_pages()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/3/21 1:31, Yangtao Li wrote:
> As Christoph Hellwig point out:
> 
> 	Please avoid the else by doing the goto in the branch.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
