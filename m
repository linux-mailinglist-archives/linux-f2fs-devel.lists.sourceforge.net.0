Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E9F5AAD19
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Sep 2022 13:08:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oU4Wk-0004Pn-G1;
	Fri, 02 Sep 2022 11:07:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <and.sco@piglight.com>) id 1oU4Wj-0004Ph-RM
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Sep 2022 11:07:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0d4YrPeddXF3RBWszuyX87hkfQXL7C/btVCimqkrzbA=; b=bJBE9ohTAkVfBpvAJxaDQYaiwI
 o28VJWRBl8Q3ETWeUc/ufwtYwfurk2MKE9YaOr98CiQMsL0KCu1zrhl7yEgLM0nSPOfvbtYEgVCFg
 N17YIjCAcqMwawWUedKP4jlXaXKUGdRzjQ8n8c34qEKnoogcaNV8kpr0txIiiWFZtVaE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0d4YrPeddXF3RBWszuyX87hkfQXL7C/btVCimqkrzbA=; b=a
 H9jKRlCeZz5Ya+TzAu+sakxTN92Aq9Dd4ysll0vdykegt8jcZILBbyPfhAfJ2Bv/0EDM572AnZYMD
 H8FQV7tjCSXyyG1l2x2LZSTv8LHB0LWEZ+o7xsb4ZaQKObHcttM+sJrUKisTPVV9qV3CAe31y82IS
 znAGP5McMYAVZr88=;
Received: from gxaoszxo.piglight.com ([85.217.145.3])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oU4Wj-0001Id-7Y for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Sep 2022 11:07:57 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=dkim; d=piglight.com;
 h=Reply-To:From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 i=and.sco@piglight.com; bh=2RNxICSB08QOsISrgdgjONv4BIM=;
 b=tM9SNKTmTMksvnwsQg6X+l7ZQxuGi5c/Gc5SJrMMlgsWA5SJhhKtvtZEzr2evgRhqwP4KhDxDZJ9
 a3uv5OCxDvR0cVX8muBBw5hBh3BoSLYHVOcCkrDrjNBqTM5txykntRgH/6jWAt4CmG+Vx7y8daJJ
 Tc9OtFx1U+Dr832gkYG11nVltH+4isNPIrDYpetcr6vNsu+Jg0rQ/3fKN7zP3PFP6XEeQHFDhba9
 7xMbeZ688DE7isqkPC/HAfkR7pV0dxcCMCfJC9O8OSatJBAarS75aqBzp/kRyVgh6Z7Iv4E6ca3x
 P9EnguvMIU0s1ZYfbTNaeD7QE2Xp4YMj1A1X8A==
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns; s=dkim; d=piglight.com;
 b=ak0p2GfBHbTuEGT/vf2h3Rea+HI24BPAzpJxfhfRH9OJfzkf9gKaZNOHU2wF/AZOEecQqEVikeak
 ILvX/zoAFbD8/feFPjw9I46yzSOgacWDqrLwAuKcN4CmN9LVkZKthKqYjbrTHmXwREV4Dejftk9k
 lE1CBdcpDWPf+2rmEC2DMG5cPzW0+8j8jvWYmdCwNoqfTGhaUhOip2cRmw1O/bsvx61+zW3Li2C/
 TPJ+TRB+v3VY8qnHe8uJrsb60KusQKzUMaW5AdnEqux7h6QkT1F8OjTDiZ9S0lCLv02jH47rrof/
 izJ6MSdFp9KVedjcUE1qTJS/GteQXaASbQ/uOw==;
From: Amjad Ali<and.sco@piglight.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: 02 Sep 2022 04:07:50 -0700
Message-ID: <20220902040750.B64DFBDA4D43CA5B@piglight.com>
MIME-Version: 1.0
X-Spam-Score: 4.5 (++++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello Friend,
 How are you doing? I have sourced for your contact
 online and decided to contact you. My name is Amjad. I am retained with a
 leading Bio Firm. The recent pandemic caused a lot of havoc in the business
 [...] Content analysis details:   (4.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: piglight.com]
 1.0 RCVD_IN_UCE1           RBL: IP Listed in UCEPROTECT Level 1
 [85.217.145.3 listed in dnsbl-1.uceprotect.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
 digit [amjalia90[at]gmail.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.9 URG_BIZ                Contains urgent matter
 2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Headers-End: 1oU4Wj-0001Id-7Y
Subject: [f2fs-dev] IMPORTANT!! Sir, I need your urgent response.
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
Reply-To: amjalia90@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello Friend,

How are you doing? I have sourced for your contact online and 
decided to contact you. My name is Amjad. I am retained with a 
leading Bio Firm. The recent pandemic caused a lot of havoc in 
the business and supply industry. It also opened up new 
opportunities as well. My company has opened up a bid for 
suppliers of some basic raw materials needed in the production of 
life saving vaccines, drugs, etc.

I urgently seek a representative to represent my interest in this 
bid. As a staff member, it is against the policy for me to bid 
directly for this. I assure you that the proceeds from this is 
very good. I have already sourced a local supplier to work with 
on this. I only need a reliable representative. I think we can 
work together on this.

Please get back to me and I can explain in further details.

Regards,
Amjad Ali


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
