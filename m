Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 307FD6F6605
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 May 2023 09:45:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1puTeZ-0007wA-BP;
	Thu, 04 May 2023 07:45:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <leos.sladek@neston24.com>) id 1puTeY-0007w4-2x
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 May 2023 07:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5T/I5ALH265FnsfRMA5qkcy2CLiS4J17pa3P6HzpuT0=; b=Zml9dho+fP9HtKCatU++diK9/N
 wxs3vJATG6pjhraL0HGsIWIbcfYq2WBh/jQ5DMT/7Df+TgH9pfU1m9Q5hVpzESUHsGQLxER79OcOy
 nhY4Rz81JACAN9fVESd9rBuJMMeEBRuaagIjngNmowTN0T9QCav7Em5RDzjUMhxmmC40=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:From:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5T/I5ALH265FnsfRMA5qkcy2CLiS4J17pa3P6HzpuT0=; b=e
 ZqvBdw3JdqgfOjRdlez3U7CbftWxi1esjF2OzDsKfayZnJqmJ63w2IyLyqHTVTVkq9xixa4r/L2qO
 LdEZiDC9N9sSThMCBQk4j9FOVreTDMFjNnC0y0iEJW1zbZi3KJ9cPsOXgutMx57KnBCVtHqEA98uG
 q1PHD4xZLMcxH6rI=;
Received: from mail.neston24.com ([37.187.225.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1puTeV-0008RG-AU for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 May 2023 07:45:26 +0000
Received: by mail.neston24.com (Postfix, from userid 1002)
 id D98BA21EA5; Thu,  4 May 2023 07:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neston24.com; s=mail;
 t=1683186316; bh=5T/I5ALH265FnsfRMA5qkcy2CLiS4J17pa3P6HzpuT0=;
 h=Date:From:To:Subject:From;
 b=ED7fybhwF+A7LlOPxAfKlg4hxFTOl/+utD/Kcn0Eysnuro9Y4zb/b4+iXr9NDQnEs
 WrLBx0RnrPbFwUD4HGBQQXK1iIlRurWbdy8oX6cRjDF79XEWL7AcyRW+f0k4xOMgPq
 Qf12Pzc1jzzazbohVfebz9iCmlhVNz945XXZKrEFiYKJsR6zSWCG3W12Vdnom0zkQ6
 QimAVAdbwR1Tjs0zvr5dS0HH+ffufRbDzFh2TPxq935G7qbsDCZFWJkfiHKSlhABTV
 3BFYETiLnXTW+1pEGQI3zW9GSbJHNRV9NoF6z3IUxUUj4J67dSHZqmUPcPY8yB2qQL
 MZmxlif9B4Lxw==
Received: by mail.neston24.com for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  4 May 2023 07:45:14 GMT
Message-ID: <20230504064500-0.1.6m.d0p4.0.nur46t7jg4@neston24.com>
Date: Thu,  4 May 2023 07:45:14 GMT
To: <linux-f2fs-devel@lists.sourceforge.net>
X-Mailer: mail.neston24.com
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Dobrý den, obracím se na Vás jménem dlouholetého výrobce
    fotovoltaických rozvodnic určených pro soukromé i průmyslové použití.
    Dodáváme fotovoltaické rozvodnice na zakázku a jsme schopni realizovat
    i ty nejnáročnější požadavky instalačních firem, velkoobchodů a
   distributorů. 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1puTeV-0008RG-AU
Subject: [f2fs-dev] =?utf-8?q?Fotovoltaick=C3=A9_rozvodnice?=
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
From: =?UTF-8?Q? Leo=C5=A1_Sl=C3=A1dek ?= via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: =?UTF-8?Q? Leo=C5=A1_Sl=C3=A1dek ?= <leos.sladek@neston24.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RG9icsO9IGRlbiwKCm9icmFjw61tIHNlIG5hIFbDoXMgam3DqW5lbSBkbG91aG9sZXTDqWhvIHbD
vXJvYmNlIGZvdG92b2x0YWlja8O9Y2ggcm96dm9kbmljIHVyxI1lbsO9Y2ggcHJvCnNvdWtyb23D
qSBpIHByxa9teXNsb3bDqSBwb3XFvml0w60uCgpEb2TDoXbDoW1lIGZvdG92b2x0YWlja8OpIHJv
enZvZG5pY2UgbmEgemFrw6F6a3UgYSBqc21lIHNjaG9wbmkgcmVhbGl6b3ZhdCBpIHR5IG5lam7D
oXJvxI1uxJtqxaHDrQpwb8W+YWRhdmt5IGluc3RhbGHEjW7DrWNoIGZpcmVtLCB2ZWxrb29iY2hv
ZMWvIGEgZGlzdHJpYnV0b3LFry4KClZ5dcW+w612w6FtZSBuZWprdmFsaXRuxJtqxaHDrSBrb21w
b25lbnR5IGEgbWF0ZXJpw6FseSwgxI3DrW3FviBkb3NhaHVqZW1lIHZ5xaHFocOtIG9kb2xub3N0
LCBzdGFiaWxpdHUKcHJvdm96dSBhIG9jaHJhbnUgcHJvdGkgdm9kxJssIHZsa3UsIHByYWNodSBh
IG7DoXJhesWvbS4KClYgbmHFoWVtIHNvcnRpbWVudHUganNvdSB0YWvDqSBvbWV6b3ZhxI1lIHDF
mWVwxJt0w60gQUMvREMsIGt0ZXLDqSB6YWppxaHFpXVqw60gb2NocmFudQpmb3Rvdm9sdGFpY2vD
vWNoIG5hcMOhamVjw61jaCBpbnN0YWxhY8OtIHDFmWVkIG5lZ2F0aXZuw61taSBlZmVrdHkgcMWZ
ZXDEm3TDrSBhIGNocsOhbsOtIHphxZnDrXplbsOtIHDFmWVkCmVmZWt0eSBwxa9zb2JlbsOtIHDF
mWVwxJt0w60gYSBibGVza292w71jaCBwcm91ZMWvLgoKQ2hjZXRlIHNpIHZ5emtvdcWhZXQgbmHF
oWUgxZllxaFlbsOtPwoKClMgcG96ZHJhdmVtCkxlb8WhIFNsw6FkZWsKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxp
bmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
