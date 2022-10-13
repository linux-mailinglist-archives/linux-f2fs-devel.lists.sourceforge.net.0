Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C12ED5FD6A9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Oct 2022 11:10:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oiuEg-0004ks-PM;
	Thu, 13 Oct 2022 09:10:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1oiuEc-0004kR-3Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Oct 2022 09:10:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qO2v/38fF0Ijky+/1bGRoD4+5ZxpwBzOuB+gI/7nA8A=; b=evwshrwvvc9biLpokgI1HJZgRR
 qDowrFfpF0wwObm8yYxK50w/Nr6LeR94AjZqyp1rcBIZ9exPDl1jNGzW6VWnmCd7n9hgYSEcMXScv
 LwYtcp8eAPrhbisDHy8geAWXvKr6SnCw1TPFMg3E3hnqfWfGvmjgW28+Z+mwt8NRxLOk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qO2v/38fF0Ijky+/1bGRoD4+5ZxpwBzOuB+gI/7nA8A=; b=kdCEEZ86UmveZijfjTHmuG6tFy
 wDimc5ghpx84muIpw291ZNo4qpK1DG2mko2M6/A6PZV87vMmQ6pgI1iJBB6lDgVtPeDRxOikH2HnE
 zKF1KcRsan/7DqN3AAlcKF1t+MtxqPbQJ21hTfEWw859OhNliRn/wPdz5MeDm0AD5evw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oiuEX-00083W-Nd for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Oct 2022 09:10:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D82286172F;
 Thu, 13 Oct 2022 09:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B58C433D6;
 Thu, 13 Oct 2022 09:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1665652224;
 bh=j2kKkOd0T3xnPKp9Kx8Cdz/iIwZaZ6+K/EenLQi0hxg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M2u4jTOrR33yM79lQjKy9yp+xsFdL+JMr2z07IJf1nc6bDQZSgVLiivCjT1/d5HMU
 /j8qBkjt1nl762MwZ+JmD97lxkdPq77b2wa63U5u9WEJ+EpBYkVJlkYSm3MQ2vRZID
 yfH3LijPed6lxIk6Mh6a4Gq7JCRvAm1cfG/cRgz4=
Date: Thu, 13 Oct 2022 11:11:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: lvgaofei <lvgaofei@oppo.com>
Message-ID: <Y0fWLC28cudpgM2I@kroah.com>
References: <1665628774-388896-1-git-send-email-lvgaofei@oppo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1665628774-388896-1-git-send-email-lvgaofei@oppo.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Oct 13, 2022 at 10:39:34AM +0800, lvgaofei wrote:
 > This e-mail and its attachments contain confidential information from OPPO, 
 which is intended only for the person or entity whose address is [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oiuEX-00083W-Nd
Subject: Re: [f2fs-dev] [PATCH] Cherry picked from commit
 e3b49ea36802053f312013fd4ccb6e59920a9f76 [Please apply to 5.10-stable and
 5.15-stable.]
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
Cc: Hyeong-Jun Kim <hj514.kim@samsung.com>, drosen@google.com,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Oct 13, 2022 at 10:39:34AM +0800, lvgaofei wrote:
> This e-mail and its attachments contain confidential information from OPPO, which is intended only for the person or entity whose address is listed above. Any use of the information contained herein in any way (including, but not limited to, total or partial disclosure, reproduction, or dissemination) by persons other than the intended recipient(s) is prohibited. If you receive this e-mail in error, please notify the sender by phone or email immediately and delete it!

Now deleted.  This is not compatible with kernel development for obvious
reasons.

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
