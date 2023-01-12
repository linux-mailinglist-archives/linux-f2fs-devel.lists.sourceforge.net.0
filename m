Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 911D9666CAD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Jan 2023 09:41:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pFt8v-000587-Sh;
	Thu, 12 Jan 2023 08:41:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zbynek.spacek@glencoeaur.com>) id 1pFt8u-00057s-Bf
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jan 2023 08:40:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2S0GQFScndXkBEK4sqdoOhOYLqsB2sEH8Q5XQfVvKpo=; b=gNFjguGBTzbCUI1G7c0bFGOduG
 J0iWxpOWRf1XTDHM8jRH/a+pjGjlnyWhxwTiW3WDaiBwu9s8fTsSR281i5+01whqCHJ5WZtd9IEXr
 sLrdrI7L0OipPvJUE4OFH326/8kljLfvwMRoflYn2H2AnCZBLPxSGc4//FToA/cl5MIw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:From:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2S0GQFScndXkBEK4sqdoOhOYLqsB2sEH8Q5XQfVvKpo=; b=D
 694wM3f46nTvzF5DYeuLJGWVhr5TtCKckvKhHcH0kwm66vgTngMRH+uR6X+t8RV7NuGMU52e8ZZCr
 uARCHBXUHoVujap7HEXfkCfyc5kNsQ7AMuTqmWCEkUu9gGSBogGS5kM4BW6RHzq4T15YIAdReJ9BU
 frGwZa20ybGzzRwg=;
Received: from mail.glencoeaur.com ([217.61.97.113])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pFt8p-0002s8-An for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jan 2023 08:40:57 +0000
Received: by mail.glencoeaur.com (Postfix, from userid 1001)
 id 0C5FC82220; Thu, 12 Jan 2023 08:40:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=glencoeaur.com;
 s=mail; t=1673512849;
 bh=2S0GQFScndXkBEK4sqdoOhOYLqsB2sEH8Q5XQfVvKpo=;
 h=Date:From:To:Subject:From;
 b=jP6uLFIq5XfZjT8sXXWYEbdmbiJkHkFv1+Ao9iS3Cb3h0dT14mS/SQ4AlaaM+olCc
 UTU21DBO9nicSwEVUsfypyeKWgJJP3r9zT8Xsj78s/HxwrJZr57LBZbf27ZfluEnfC
 pPt7CnOeZ5L0F4rrmgJan5PoIsPGFORUh4w4sUAeDwCf7OW3m+aaJRazYJn8BJG7lD
 S4q5jH4K1cZabbe+pGQ8YzE9ZeHDvdAZ8bv7jKFH37yk4NCQJVLsoIxZcEN3XO9Efx
 69NQKNn8hB+I7rMxapOfi3YGP4An4IBRBAnkby+blaDHoJnyMvrL43lc5hAT3TLhOc
 nE5+VEa3j8T5Q==
Received: by mail.glencoeaur.com for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 Jan 2023 08:40:39 GMT
Message-ID: <20230112074500-0.1.z.3gcb.0.036cp01wx6@glencoeaur.com>
Date: Thu, 12 Jan 2023 08:40:39 GMT
To: <linux-f2fs-devel@lists.sourceforge.net>
X-Mailer: mail.glencoeaur.com
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Good morning, do you need intermediates for processing,
 plastics
 (e.g. rubber) or silicone mixtures? We provide a wide range of silicone
 rubbers
 with various properties, silicone mixtures from renowned manufacturers such
 as Wacker, Elastosil LR and dyes, stabilizers, primers and anti-adhesive
 additiv [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: glencoeaur.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pFt8p-0002s8-An
Subject: [f2fs-dev] Silikonmischungen
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
Reply-To: Zbynek Spacek <zbynek.spacek@glencoeaur.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Good morning,

do you need intermediates for processing, plastics (e.g. rubber) or silicone mixtures?

We provide a wide range of silicone rubbers with various properties, silicone mixtures from renowned manufacturers such as Wacker, Elastosil LR and dyes, stabilizers, primers and anti-adhesive additives.

We also produce technical silicone compounds with increased resistance to oils, resistant to high temperatures and water vapor, conductive and many more.

We provide fast order fulfillment, timely deliveries and cost optimization.

Can I introduce what we can offer you?


Best regards
Zbynek Spacek


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
