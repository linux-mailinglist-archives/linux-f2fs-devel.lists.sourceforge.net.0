Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D416BC99A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Mar 2023 09:45:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pcjF8-0001RL-5g;
	Thu, 16 Mar 2023 08:45:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zbynek.spacek@paretdee.com>) id 1pcjF6-0001RF-FZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Mar 2023 08:45:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FLMIyM7qOCOVEMp1o/ltkgnLeuU0ZBlT9xWiZMBZ7Ag=; b=XM+ow64lwl7slzK+nuHh4Wyo5I
 yweSvtl+Cv8w4X2G+fNN12Og+aXtI/HavjBQ3E3QoBXp5XlvG39u6mjgMdVi5BOIVvh7znj9AlFvq
 Tc/aq3rd69zE6Dtjo9VfG6ohaZPCmqrASdAfvIUN+mn2yYr/jpsOfS4azqXb0C2FPMYs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:From:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=FLMIyM7qOCOVEMp1o/ltkgnLeuU0ZBlT9xWiZMBZ7Ag=; b=M
 3JDp8WztntZlsTNDWstjz5m9sSlTIDX3z3+aK31F4SEhTirJacHrQ/IYjbeLZCdnP4LAxtvyFke2j
 F6QYCpzjyvvX+L8fIsmpnaZ9C503WliewVtGdPhAbbEG7VGG57m68dR0GpBsS8kGAgJS0GUV07UfH
 2v9/ZRqPqmEO07dQ=;
Received: from mail.paretdee.com ([141.95.17.174])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pcjF6-00AWvX-5q for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Mar 2023 08:45:48 +0000
Received: by mail.paretdee.com (Postfix, from userid 1002)
 id DB937A296F; Thu, 16 Mar 2023 08:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=paretdee.com; s=mail;
 t=1678956341; bh=FLMIyM7qOCOVEMp1o/ltkgnLeuU0ZBlT9xWiZMBZ7Ag=;
 h=Date:From:To:Subject:From;
 b=BM0qPNPoaRTWe0Ith6pUbcb5WfqV5m5FBncnC98VPVYJa0UFhKVNDQHyXldZU1wm/
 cG2m0phq4Waybj0It1tO/EL2b4Bd/jDjO030d1uaxJMQHvQg5Ot8Vsk/voodJiCJIA
 7NLI64KwpmhZKzMcwWh4w3UUWwzzcIEGczRlfR6UJl+xG2KISAHUr5VbkbzcIhOBbE
 aKpyCBKw2nH8RnrJzKBKq9deqHQOC/jV/qkxyeWxHNWgD92CGyq4CBNDpJKCv/JBsJ
 Z1vvZ+ivyaayE3edENUitvKUQQx34p0Z7Oiw8ayRsuJ49HEMnW8p13mP53tlPJsBms
 yoZsPtwFSmkZA==
Received: by mail.paretdee.com for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 Mar 2023 08:45:39 GMT
Message-ID: <20230316074500-0.1.5h.cmd0.0.y1jk0mb0h5@paretdee.com>
Date: Thu, 16 Mar 2023 08:45:39 GMT
To: <linux-f2fs-devel@lists.sourceforge.net>
X-Mailer: mail.paretdee.com
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Good morning,
 we can offer unbeatable conditions for the supply
 of various silicone compounds and rubbers, liquid silicone rubber (LSR).
 In our assortment you will also find cross-linking agents, stabilizers, dyes
 and individual silicone mixtures that we will develop for your needs. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pcjF6-00AWvX-5q
Subject: [f2fs-dev] Rubber Molded
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
From: Zbynek Spacek via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zbynek Spacek <zbynek.spacek@paretdee.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Good morning,

we can offer unbeatable conditions for the supply of various silicone compounds and rubbers, liquid silicone rubber (LSR).

In our assortment you will also find cross-linking agents, stabilizers, dyes and individual silicone mixtures that we will develop for your needs.

Do you want to know what we can offer you?


Best regards
Zbynek Spacek


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
