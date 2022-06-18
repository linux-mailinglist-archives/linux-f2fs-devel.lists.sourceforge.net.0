Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 46755550787
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 Jun 2022 01:42:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o2i57-0006Az-VX; Sat, 18 Jun 2022 23:42:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1o2i57-0006At-CC
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 18 Jun 2022 23:42:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OZAXgFRyvH7rUVdODM/FAFAZfx7lPesSH/H9Sf+940w=; b=h8ZXHLnIIQLYttAX4tjgFZitaj
 JfpBVD9k/edKOanQohBEumK50sOCkS6FeNPfsj7CT49M1XS9GNonbbezY/PLCOkQV+yskS3e9Qw6b
 S/MsaOOFuVv+NSqVXgG3sDayVb8MsxBIseRP1LUN86NxeKzyC1jeJA3jAqKGKhwBGDIc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OZAXgFRyvH7rUVdODM/FAFAZfx7lPesSH/H9Sf+940w=; b=N9DszLiDyaiGnDEmxjn0iGBK7E
 jEvT2BjFBZvdITAsLCzqJeW13ZUDY6rWA03Uod8AAfzqaRjDywdEEFzIT+n2LnfpwYaJpRQ2P5IuF
 KHlHNfe1oewV7/Hk4t+GTYUXfFPzgnsRmvod76jWJ9WunqOWitus4EObb4dEqqbhX8ac=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o2i57-006nuS-DO
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 18 Jun 2022 23:42:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 23D7FB80BA0;
 Sat, 18 Jun 2022 23:42:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D82C3411A;
 Sat, 18 Jun 2022 23:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655595733;
 bh=bMlV0wSAXJpPza36kzPUUfHFX1zImGL1AGY3tf8tCvk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jxXZqPmSs8I5NGI6i3N8EQugiO6s1Cn2usHia7wi5l1LJSMpUHlI7magQtm+/BT92
 Hyht/XEZtOA7kcYA1v/OXDIAGJLou0f6eutio8IdYEcGQmMQqw6yIs775XV6+0VwGo
 CE8uQSAFj4kuzeTt1yKRndc8E1Ho0u9nn784Ysgv6wzHuCaYC34QlAbxhAJqxpADIo
 RtVqdeWtvssTRTuzqFBk0mS9vc5mCkWGTw8py10CNdewdmugjVRB8fv08xsptfU4wj
 9wVk6g3SV6eZo5Cjri20D09tZRBUpn7kducoP81HcDDpPWwGEFdDUHXUs+pYJHnRQX
 CSxpOsW2iVqGQ==
Message-ID: <1fa8d02a-9e76-027c-dad4-a03b14a261d4@kernel.org>
Date: Sun, 19 Jun 2022 07:42:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Bart Van Assche <bvanassche@acm.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220614231724.776264-1-bvanassche@acm.org>
 <20220614231724.776264-4-bvanassche@acm.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220614231724.776264-4-bvanassche@acm.org>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/6/15 7:17, Bart Van Assche wrote: > Change the type
 of the third argument of f2fs_report_zone() from void * > into struct blk_zone
 * to enable type checking. > > Signed-off-by: Bart Van Assche [...] 
 Content analysis details:   (-7.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.8 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o2i57-006nuS-DO
Subject: Re: [f2fs-dev] [PATCH 3/3] Improve compile-time type checking for
 f2fs_report_zone()
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

On 2022/6/15 7:17, Bart Van Assche wrote:
> Change the type of the third argument of f2fs_report_zone() from void *
> into struct blk_zone * to enable type checking.
> 
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
