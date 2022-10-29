Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7532E611F7A
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 29 Oct 2022 04:56:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ooc0y-0000PV-SA;
	Sat, 29 Oct 2022 02:56:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ooc0v-0000Oz-Hh
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 29 Oct 2022 02:56:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yL4Qj9DIVb2Q8fyb6QWpzNa+LhdfTN8yL4PBrrsZGOQ=; b=GpBJbupWT9E11L2Gbrw4zJjP7e
 IA4u8X+3GO/uz7NlfStvmlbNYqPdBqagrmP83Y6qN54nhA5/5S5lsq7qQpNEvh23ij2eA8aPsT06y
 xmt6QPJ/dh5/Drh9QQD1Fg9SPsrroTVNzmpn3lKc6A4yJpAZZjs5sUpfZ9dSQGXF5lAg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yL4Qj9DIVb2Q8fyb6QWpzNa+LhdfTN8yL4PBrrsZGOQ=; b=GOgbi2mwY4qcok5hHTvDdef+dE
 r1WYt3jSdGWBm4rZAiE1SMK3+YT18CkzRmEKnuy+xQjyPYx+OEElc1HUF1TBDKCBDTFBH1Zr03z31
 vbctT0zffguS0nPH8vVpDhgR8buTh/y/8URfX26YHsR39RL3UCmgVXnTIMCeecwYDinM=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ooc0q-0001Ic-Ci for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 29 Oct 2022 02:56:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BA473B82E00;
 Sat, 29 Oct 2022 02:55:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 138A5C433D7;
 Sat, 29 Oct 2022 02:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667012140;
 bh=RxC13kMBfY3jA/I0va0EdOxfffvxi/dwXbNjcthKyJ4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=a54Y++6FDUWWZJ7OppKBOT52neHOOlEhvVMmyL/H5nH2sWCp0XP8Yu54HZ7aa8l2b
 BK6V8MJmGr3Y8mz329xlhGTRO72da/r8N95iRMXJqy6B9e9K9FBiundZ1ZFyvysxv0
 zAN9jmBaCf5NcyDlegGD5ujLd4+NGAss37W4amgeqWMIEvQgQOqWfxsLV5K9Uk0F5v
 dw9cfCfHoLpgdNqAN3x22kJBPDQL0t8ZJLuhLgBzpo1SzveIv3/cBoQhMD8zU1UYdP
 TT2v/f4AuEP7Csy75UoCR1DgpeeckYRxx1Yso7uxbs08TNi6Q4vxkO/xHGKrKxoVHo
 FhcnIVe5IyfJA==
Message-ID: <4de69c67-b18f-0b1e-6a55-642120e8c675@kernel.org>
Date: Sat, 29 Oct 2022 10:55:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: Mukesh Ojha <quic_mojha@quicinc.com>, jaegeuk@kernel.org,
 mhiramat@kernel.org
References: <1666861961-12924-1-git-send-email-quic_mojha@quicinc.com>
 <1666861961-12924-2-git-send-email-quic_mojha@quicinc.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1666861961-12924-2-git-send-email-quic_mojha@quicinc.com>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/27 17:12, Mukesh Ojha wrote: > Data type of msg
 in f2fs_write_checkpoint trace should > be const char * instead of char *.
 > > Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com> Reviewed-by: Chao
 Yu <chao@kernel.org> 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ooc0q-0001Ic-Ci
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: fix the msg data type
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
Cc: quic_pkondeti@quicinc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/10/27 17:12, Mukesh Ojha wrote:
> Data type of msg in f2fs_write_checkpoint trace should
> be const char * instead of char *.
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
