Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0B5A83B38
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Apr 2025 09:32:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u2mOY-0005jA-To;
	Thu, 10 Apr 2025 07:32:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <uplinkr@airmail.cc>) id 1u2mOW-0005it-W0
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Apr 2025 07:32:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:References:In-Reply-To:Subject:Cc:To:
 From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K6n9/N77YdG8ToPgddwrH5jv0UNly2cxvgem9WzKmcs=; b=QpP4VxWzoWl2JgwrIIWlTTLV8K
 uuMfl/z9axkQVi0Ui73QObp+Rg5QYNgQOVowYExPKxLHYbLyWimxw41pUjws3mq+hnOJr9lYk3P9g
 1lBlNU2fGlplyEz7eR4hulWw31sqmBZGcsOihdbKuHBhUjwa5FB+Me4xZoAwyChDQOkc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K6n9/N77YdG8ToPgddwrH5jv0UNly2cxvgem9WzKmcs=; b=fK5KbP/AyMqzrufUmVLr19WxbT
 nhzg9TbT9Zje6zyb0KWW15UM3vAurAPQnyHzen4U9a5NBLw5zJUTUxgF1skwtbvmv3gTnZ3iB4o8B
 Y2A/2xOPLLMb266eSgcT0etm56guhU86qYoTtGNezugDqX1lsJxNcpHN49PzQM79X/s8=;
Received: from mail.cock.li ([37.120.193.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u2mOH-0006uZ-83 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Apr 2025 07:32:17 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=airmail.cc; s=mail;
 t=1744270308; bh=rrWcgG0GwCgInxuxDeptmVDw0cfT5V1AsDbIga693NQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=O4lXINnbhtYXuERxGxLsadDG3yD4/WQdXZyEF4YA0Iy5YdUNp0vp/mgXYPJBtFXpr
 gL0CFKofT4bHaT9kaoZNLXjAjHoT8ZOE9bNuWAzxp7WRyTnu3vP4dai+LRyKnPOcWe
 5POcg2gLH+osVnqucNH53iDPGXogL9qo5w+8lOmVtX9MyAtLeLmq/R89iBBsYWLoQ0
 j7lJRx0u9qhGIxSsGbJabSXP2zeyYzq0iFVRQbptjzTFJL53IuanW0sckIxUWa1OkP
 WmOrcBnwkiyao12VJG/eLw2NBzIZ6Ln5nUF5sYkb6i5SYx2I69toz4yABZMTTB+S+V
 pGiWAjyn2UmSg==
Date: Thu, 10 Apr 2025 10:31:48 +0300
To: Chao Yu <chao@kernel.org>
In-Reply-To: <46507541-7e11-435e-b57a-7ed945ddc182@kernel.org>
References: <88f281ff9ff9b1fb899c92d6b32f52b7@airmail.cc>
 <CAD14+f1CYZ-OyKg36b_=VPmbBK0LSiieq1pgtXUy4OV2+KrR_g@mail.gmail.com>
 <6e929f78-ab82-434b-a553-6e56d38fcfcc@kernel.org>
 <80e1ae8eddff0536f09ca07e802fb983@airmail.cc>
 <46507541-7e11-435e-b57a-7ed945ddc182@kernel.org>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <4b1bcdb1a3ee0a26c89c828c7121637c@airmail.cc>
X-Sender: uplinkr@airmail.cc
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025-04-10 10:17, Chao Yu wrote: > But still I didn't get
 why we can run into this situation, since as you > said, resize went through
 successfully. Could you please provide more > details about pr [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: airmail.cc]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [37.120.193.124 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [37.120.193.124 listed in bl.score.senderscore.com]
 0.0 URIBL_DM_SURBL         Contains an URL listed in the DM SURBL blocklist
 [URIs: airmail.cc]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1u2mOH-0006uZ-83
Subject: Re: [f2fs-dev] Resize metadata corruption
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
From: uplinkr--- via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: uplinkr@airmail.cc
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025-04-10 10:17, Chao Yu wrote:
> But still I didn't get why we can run into this situation, since as you
> said, resize went through successfully. Could you please provide more
> details about process of resize? Parameters for resize? Logs you kept
> during resize? etc.

Hello,

I'm afraid I don't have any logs beyond fsck because I was running all 
operations off a live ISO and didn't have the foresight to save the 
logs. I will attempt to replicate my actions on a VM to have further 
insight.

I started the resize in GParted. It initially went through with its GPT 
workflow (resize the GPT partition, move F2FS to the left, exact steps 
are unclear). Proceeding to growing the filesystem, however, it errored 
with "Mount unclean image to replay log". I initially didn't take this 
at face value and rebooted into the system to see my filesystem 
completely intact (regrettably, not taking a backup).

Afterwards, I rebooted back into the live ISO, mounted and unmounted the 
partition and ran "Check" in GParted. It first triggered an fsck (which 
suggested it the filesystem could grow), launched resize.f2fs (which 
went through successfully) and ran fsck again. This is where the fun 
stopped: GParted freezed dead. I killed it and ran fsck in a terminal 
with the same args as GParted (-f -a) and regrettably pressed y on 
restoring lost files. It listed a lot of my files (which I recognized by 
filenames) and went on for about two minutes before erroring with 
"Segmentation Error".

I hope this will be helpful. Thanks.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
