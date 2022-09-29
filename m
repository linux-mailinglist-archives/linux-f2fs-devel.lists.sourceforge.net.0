Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 134595EEC80
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Sep 2022 05:41:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1odkQ1-0003z3-Ek;
	Thu, 29 Sep 2022 03:41:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1odkQ0-0003yx-2m
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Sep 2022 03:41:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I/wZTcVLGdpquktgGca4UlOaGXlXj1pdaN9EtQ1KziE=; b=ERZeBmin/ZfrKxqNVw1K5R1itQ
 gkVwnHB1zzlH5xRcthBlgqdIJGfq+kHxCD7jVpVuiB1x4yITq3TJVhs1IYmdP71SXvizV//Rfun23
 oqsbA1uP1uzWKT0dn69vwWZs6+NNuTPTJalb+9BXwhL4p84p7VxzVOmctAkwzWfJ4OU8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I/wZTcVLGdpquktgGca4UlOaGXlXj1pdaN9EtQ1KziE=; b=ef0sxZROr5yeUCrZ8BLVEwy3kW
 q2LuHb5CMFyP+4AkapXpINqWEZ+8o6RPt4KhBOBq4VsKmilGf9aAmb+AH1eO1KqeuVGtnoaMdTjKa
 x1LaDsVC5xwNW2/k3P+Wxh0bkCj+UXc4Eq17d5yohnRzPsWgLi5+vD4zUKA8viMuyA2c=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1odkPy-006B8j-KB for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Sep 2022 03:40:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 926D06111E;
 Thu, 29 Sep 2022 03:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15067C433D7;
 Thu, 29 Sep 2022 03:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664422847;
 bh=w6ChsY7zHJSK9/HpKNqsRjB0gjBsH+NrcshDWxTS/IE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ayWOr/nyzoYnfQYxLpw43khKgld+XTHOA2UVl8h51nlqn/5GD8r/er6WV9dB20HC7
 whUcsADbppJzcemB3IP3JmTu8LNsYC1Y6YkrE4mL8sBHU6SoRTD8R6EdSNHvR7u2Y6
 l3TusJwguFazzHNZu9S6Vgy7tkiw+Y5cjvnX+u3E69i5sdoX9Z8Kbx4RpMaBxFqo8I
 3FKxBDiCuTvkGBY7K55soa1/H8Th+EPamrxN0p1syOuVTV0FDcO0qb/f/hFz/Udt8b
 0zSUhE3FtoHS5yMn2R+7gLD3NVxg7s9+KOrEbldhGhBQXpJDU8ws0nRs7GgQ5gJGBd
 Wiom1ivgaRmpw==
Message-ID: <10f6d21e-7716-3a4d-d64e-496a4ace698f@kernel.org>
Date: Thu, 29 Sep 2022 11:40:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Zhang Qilong <zhangqilong3@huawei.com>, jaegeuk@kernel.org
References: <20220923071756.43711-1-zhangqilong3@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220923071756.43711-1-zhangqilong3@huawei.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/9/23 15:17,
 Zhang Qilong wrote: > Whehter or not error
 occurs, checking "err == 1" is unnecessary > in f2fs_xattr_fiemap(), and
 just remove it here. > > Signed-off-by: Zhang Qilong <zhangqilon [...] 
 Content analysis details:   (-7.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -2.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1odkPy-006B8j-KB
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: remove the unnecessary check in
 f2fs_xattr_fiemap
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/9/23 15:17, Zhang Qilong wrote:
> Whehter or not error occurs, checking "err == 1" is unnecessary
> in f2fs_xattr_fiemap(), and just remove it here.
> 
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
