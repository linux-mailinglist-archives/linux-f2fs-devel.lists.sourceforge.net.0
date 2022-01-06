Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7F24866C4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jan 2022 16:34:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n5UmD-0000SV-Vl; Thu, 06 Jan 2022 15:34:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <antoine@lesviallon.fr>) id 1n5Um5-0000SA-TD
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 Jan 2022 15:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:To:Subject:Message-ID:From:
 Content-Transfer-Encoding:Content-Type:Date:MIME-Version:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pQ8WNeWo54miTi9CXuCJ4uEiY8a26IpSpfGsAgwBv84=; b=fHvHUdByO4jdRR1HP9BKYrAan0
 FaBTo38NDw6y8grXctKgSzzlJxwdpgofXyHgzaEJQf/PCOO1dQ9mzVm/K1KBTcuTeiMhYU789xEh7
 s9wKGatNjQI7qn1h1xbAOBxFLoi5PfBChMvL8ZznVV0atrvUV2+eBXKBgLkb0beWAkxQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=References:In-Reply-To:To:Subject:Message-ID:From:
 Content-Transfer-Encoding:Content-Type:Date:MIME-Version:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pQ8WNeWo54miTi9CXuCJ4uEiY8a26IpSpfGsAgwBv84=; b=PjQ0y8q5y1Siipa6gau0L1ukQC
 Gab+2e/phqqpg2f6+54JCsDMFniz1mXsFpDmH1B+oz4QeW4nTwhwoYaokGLoYZdpETn46pMeyrwk/
 4wnseMa1p3O2eUikmgfFrOSu2ky8krZu0EMMpN9OAr7K0wfO4b/eUAmOhO9bncBRD7dk=;
Received: from lesviallon.fr ([82.66.80.223])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n5Um3-0047bb-Dz
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 Jan 2022 15:33:56 +0000
Received: from authenticated-user (lesviallon.fr [82.66.80.223])
 by lesviallon.fr (Postfix) with ESMTPA id 9AE4862A6219;
 Thu,  6 Jan 2022 15:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lesviallon.fr;
 s=dkim; t=1641483223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pQ8WNeWo54miTi9CXuCJ4uEiY8a26IpSpfGsAgwBv84=;
 b=d88++aEoOmgoHHWAcpP6b6n86GEUOVRyM+mv9VpfauT/2ajQCXcqwynxxFCWDIFdwni+9f
 X+LQ8xDgBPUht1284lzLhF0o47dQhTgRSkRCCNsbXW7CYGpzzjsabIc759wzuq6G1lHaDM
 cAKlpNRuV4RkQtZZkjkb+W7efGR5i7Q=
MIME-Version: 1.0
Date: Thu, 06 Jan 2022 15:33:43 +0000
Message-ID: <085f5193dc533d787545456dfadcbe55@lesviallon.fr>
To: "Chao Yu" <chao@kernel.org>, "Antoine Viallon via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
In-Reply-To: <a6ee8d0b-1d67-0bcb-ba8c-06b0d691bb17@kernel.org>
References: <a6ee8d0b-1d67-0bcb-ba8c-06b0d691bb17@kernel.org>
 <20211230002942.298407-1-antoine@lesviallon.fr>
 <e8b0f25177675008c0eb234220ceb31f@lesviallon.fr>
X-Spamd-Bar: /
Authentication-Results: lesviallon.fr;
 auth=pass smtp.auth=antoine@lesviallon.fr smtp.mailfrom=antoine@lesviallon.fr
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA256 Thank you
 for your reply. > How about showing this message in debug mode? may be under
 level one? > > Thanks, > 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1n5Um3-0047bb-Dz
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: Add progression feedback
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
From: Antoine Viallon via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Antoine Viallon <antoine@lesviallon.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Thank you for your reply.

> How about showing this message in debug mode? may be under level one?
>
> Thanks,
>

The debug output is extremely verbose, even at level one (I measured hundreds of messages per SECOND on a SATA SSD).
If we print the progress in this output, it would be completely drawn in the other messages, therefore making it useless.

Thus, we should either decrease the debug 1 verbosity (hard), or add a new, independent flag (or way) to control it.

What do you think?
- --
Antoine Viallon
-----BEGIN PGP SIGNATURE-----
Version: OpenPGP.js v2.6.2
Comment: https://openpgpjs.org

wsBcBAEBCAAQBQJh1wvUCRDRJrE6tVXhbwAAR4MIAIPldpzkLHQbgdegLTTd
ZqrjGpTrcUkKctCJKKwiZ7KrvXsnoPpl1WmlGt/ALeGeXEZgmKY1jY2pfwJK
yhpfiykTZxcypDft6YrezJaclv+RgqADwQmVxsQvN8XYm3M71RM6GQd0+/6Y
I+yWlHZtgnG/5IViGp/eEK7UDGOtneIk7CQ+Znr4TaUXN4S95rFL9gU1Y1At
/Gty7ATbU06xSIFVh0SML3FynPE3wd7tI1F6a/MQFrGJiJyL2Sa5pelwGOSp
w2Y6JDyKgTHre6SdWUYsw23+99Pb7iwF+UkxYcyYWm1w+YY9cdHEM79Sx9ww
G6z0RXAj0unRaT9FogyxJQ4=
=jkgi
-----END PGP SIGNATURE-----


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
