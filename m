Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD2B5FD6D0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Oct 2022 11:16:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oiuKA-0004uf-05;
	Thu, 13 Oct 2022 09:16:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1oiuJd-0004tw-Fa
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Oct 2022 09:15:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ydmMWffeAgZX01a33RZq4yfT3HCqDYPbbQN59SWq+WM=; b=ixk4EYEvYwxFjbFcOP9Cjj6DRe
 vYJ4fgNxb2gOlBsdbscIJhlnDqYp5ftZOilage2opTmDGWEI/QA3lFgvDhE7YmQ8MXlKQPcCXulTd
 JgXyIQEc/rxaxTOWD0LUXZ5xmj88xpqwzThiKMEYxp0LzdszlxJoGOzYuM1UcSPOwsmo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ydmMWffeAgZX01a33RZq4yfT3HCqDYPbbQN59SWq+WM=; b=KPRNafl0zg8fLrnh8bgjTD8F2a
 Qd7usPCP+Pduazt8RtTnUarzr3PltnKj7JAzwbX7cVNKmPVE2Sdu0WhJb8nzCI0ag5oGWp9Hh3eb+
 VJ51rfFDLpqQB1l7ho9ctbgsSeiRQZthdtzdlDmP00we0zlS+k9HdSBD8jHYoLE3rg/I=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oiuJZ-0022UT-Ls for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Oct 2022 09:15:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DA1E161738;
 Thu, 13 Oct 2022 09:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC629C433D6;
 Thu, 13 Oct 2022 09:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1665652529;
 bh=NSVoBHtx/v9xylrxu6NISpCezpgvGk1nSHXNLuqHq+g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rOqxnHs9JPeajilAs4GloCz+hZSJTX1yKl3lFbKHsxJxEv5vsFOq/fBmaFrk2Jq2H
 TiLgN7BwcVzM4bvkzGzMtCC5xQod1edUTGlVe9ty3QOV7oM6Qh1X5wY/6PWmw4mip0
 MR3fIMtZYSAxm/lcyUPC+dquYAQonci/hBFsaKaQ=
Date: Thu, 13 Oct 2022 11:16:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: lvgaofei <lvgaofei@oppo.com>
Message-ID: <Y0fXV46Pwi0ilzsN@kroah.com>
References: <1665642400-410526-1-git-send-email-lvgaofei@oppo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1665642400-410526-1-git-send-email-lvgaofei@oppo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Oct 13, 2022 at 02:26:40PM +0800, lvgaofei wrote:
   > > OPPO > > 本电子邮件及其附件含有OPPO公司的保密信息，仅限于邮件指明的收件人�
    [...] 
 
 Content analysis details:   (-5.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oiuJZ-0022UT-Ls
Subject: Re: [f2fs-dev] [PATCH 5.10 5.15]f2fs: invalidate META_MAPPING
 before IPU/DIO write
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
 jaegeuk@kernel.org, gregkh@google.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBPY3QgMTMsIDIwMjIgYXQgMDI6MjY6NDBQTSArMDgwMCwgbHZnYW9mZWkgd3JvdGU6
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBPUFBPCj4gCj4g5pys55S15a2Q
6YKu5Lu25Y+K5YW26ZmE5Lu25ZCr5pyJT1BQT+WFrOWPuOeahOS/neWvhuS/oeaBr++8jOS7hemZ
kOS6jumCruS7tuaMh+aYjueahOaUtuS7tuS6uuS9v+eUqO+8iOWMheWQq+S4quS6uuWPiue+pOe7
hO+8ieOAguemgeatouS7u+S9leS6uuWcqOacque7j+aOiOadg+eahOaDheWGteS4i+S7peS7u+S9
leW9ouW8j+S9v+eUqOOAguWmguaenOaCqOmUmeaUtuS6huacrOmCruS7tu+8jOivt+eri+WNs+S7
peeUteWtkOmCruS7tumAmuefpeWPkeS7tuS6uuW5tuWIoOmZpOacrOmCruS7tuWPiuWFtumZhOS7
tuOAggo+IAo+IFRoaXMgZS1tYWlsIGFuZCBpdHMgYXR0YWNobWVudHMgY29udGFpbiBjb25maWRl
bnRpYWwgaW5mb3JtYXRpb24gZnJvbSBPUFBPLCB3aGljaCBpcyBpbnRlbmRlZCBvbmx5IGZvciB0
aGUgcGVyc29uIG9yIGVudGl0eSB3aG9zZSBhZGRyZXNzIGlzIGxpc3RlZCBhYm92ZS4gQW55IHVz
ZSBvZiB0aGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGhlcmVpbiBpbiBhbnkgd2F5IChpbmNsdWRp
bmcsIGJ1dCBub3QgbGltaXRlZCB0bywgdG90YWwgb3IgcGFydGlhbCBkaXNjbG9zdXJlLCByZXBy
b2R1Y3Rpb24sIG9yIGRpc3NlbWluYXRpb24pIGJ5IHBlcnNvbnMgb3RoZXIgdGhhbiB0aGUgaW50
ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHByb2hpYml0ZWQuIElmIHlvdSByZWNlaXZlIHRoaXMgZS1t
YWlsIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgYnkgcGhvbmUgb3IgZW1haWwg
aW1tZWRpYXRlbHkgYW5kIGRlbGV0ZSBpdCEKCk5vdyBkZWxldGVkLgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
