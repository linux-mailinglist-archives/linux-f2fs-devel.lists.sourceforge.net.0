Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0BC52F175
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 May 2022 19:21:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ns6Jp-0000Rv-8u; Fri, 20 May 2022 17:21:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <krisman@collabora.com>) id 1ns6Jn-0000Rp-UJ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 May 2022 17:21:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cchiD00OiseitEtPhXzpyofJLAGwvO8slK82/LRHOSk=; b=Rdrob5jxlypb3UUQCRITwLNvQ0
 ON4ssnXh2cX+fAgmBTFQN5/Z734O1924vPBs9qOTX/v/Ehl9Xb5AiYJswqu6Vw52HSm0AzeaAozAb
 s4FYIP94XNwoJU6+McnutcBVNvIiRGNEUUCaEKYHFyCJc+uIvhpDH/kmB6QCwkomSdvo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cchiD00OiseitEtPhXzpyofJLAGwvO8slK82/LRHOSk=; b=Bc/rW31TvwSDBkXIxMM1wM4iu/
 MoSHLAkl68lno9+guW59ip4MQ3VLz6NOM1razQnNIr96pHpFFkMLp1AKD7WtD1Zq8hiagfkNR4RSC
 zjhZhOfXQDGLEXlnvDcLcMPH8TMEYlmdQmV28Dt1dHwScXIEmhx4XKdW/iA+S9Y6mf8o=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ns6Jk-0002yB-FJ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 May 2022 17:21:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id BFD491F46726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653067283;
 bh=nxHUg1U1wjVU0hfczLwATkd9dA/b0ruMNZpmXbtKT4A=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=j/9SsfLfim+cTj5jMfVxQ34lLVnFspAX/TnPixbH6JdcuuaI3E3YzOlkC4N8qwGcU
 slCCuUhMftUXUZ5q6sCNZvoa1cWMibArHRErbqGPDqsQyFTq37C1NvfQjqX8e6Az9t
 tlsvP+jtkbu6LYWBxC3xSmiLpSMg7ufA3+5RlG/7bW4UEmNQmaZxyB3eueYsglWsth
 m7cC4XO8HBeJztqpxmYGg9KufkvMK4uuVE1ye2St0JCEPOEUDCoPD09Kf+8h5Fz0pj
 ty7i9jpXJZUFKoz636w2kBgJuO0yIkYkeM2Ryve5ySUHR2RJdpAYlnazoVPdUYwDta
 eNR+O/DmLq+Ew==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Eric Biggers <ebiggers@kernel.org>
Organization: Collabora
References: <20220514180146.44775-1-ebiggers@kernel.org>
Date: Fri, 20 May 2022 13:21:19 -0400
In-Reply-To: <20220514180146.44775-1-ebiggers@kernel.org> (Eric Biggers's
 message of "Sat, 14 May 2022 11:01:46 -0700")
Message-ID: <87sfp46rxs.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Eric Biggers <ebiggers@kernel.org> writes: > From: Eric
 Biggers
 <ebiggers@google.com> > > Test renaming a casefolded directory located in
 the top-level directory,
 > while the cache is cold. When $MOUNT_OPTIONS contains
 > test_dummy_encryption, [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1ns6Jk-0002yB-FJ
Subject: Re: [f2fs-dev] [xfstests PATCH] generic/556: add test case for
 top-level dir rename
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
Cc: linux-fscrypt@vger.kernel.org, Daniel Rosenberg <drosen@google.com>,
 fstests@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eric Biggers <ebiggers@kernel.org> writes:

> From: Eric Biggers <ebiggers@google.com>
>
> Test renaming a casefolded directory located in the top-level directory,
> while the cache is cold.  When $MOUNT_OPTIONS contains
> test_dummy_encryption, this detects an f2fs bug.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  tests/generic/556 | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Reviewed-by: Gabriel Krisman Bertazi <krisman@collabora.com>

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
