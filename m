Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8387A815E46
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 17 Dec 2023 10:16:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rEnG9-0008T2-Nc;
	Sun, 17 Dec 2023 09:16:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <amir73il@gmail.com>) id 1rEnG8-0008St-65;
 Sun, 17 Dec 2023 09:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lbSaVhmyYdnzBKhQuQo4oOm2wwCddJ5JEF6JG+CBOso=; b=Wsu4eNTmd+7MRbzqfL4oRAeLIl
 wbfYqnUEsJ40b9nw+tE76FErJrPBNAvbonDjunmNzbwHarO0qXpIyEScbsMSZNYvJb1zmVO0u3aP1
 NqYp+WszRDHQz5K+0VUhl75p7B4vrcmlPHeB5rH2u4uT3c3Ej1jXn4jOyLXcI0L52jh8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lbSaVhmyYdnzBKhQuQo4oOm2wwCddJ5JEF6JG+CBOso=; b=WWohBuIOjL61RclxrZUyU5WNOP
 XnV/TBaIJJASsACM+08irJ0r0hpNSCjbzsLVYfNCJ0/bBuABXpjagqY02ceYG4jAM8o+HTp69vRJc
 ZGaqvCPamCwgNjQU3lJ4c4gQFaq8iX8JYE9r2vC4KWcDEekAvvUIG4fS02sPpcxnuZuo=;
Received: from mail-qv1-f46.google.com ([209.85.219.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rEnG6-0006zV-Gl; Sun, 17 Dec 2023 09:16:28 +0000
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-67ef18444ecso19466666d6.0; 
 Sun, 17 Dec 2023 01:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702804580; x=1703409380; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lbSaVhmyYdnzBKhQuQo4oOm2wwCddJ5JEF6JG+CBOso=;
 b=ArzUFuVWyOMPvshuhD6LeUj4MMS/uCiPPgSq+SMqcz1r9u9NEpeEYxE6TnEEMUM43g
 ykXxDEg4V5avv0yjzv+Sk5klD+yv2PWp36DN9U8PiTP2t88b2Wq2cpqWWS+zU01URCwq
 EBW9JSbPJH5TkUIfrKt+Q3csQeo3o3BP8z0kBUsRhAaNyslOsCAJ1jrus8tc/7QBMfGr
 t5UXZCdT03cUwBFoya/K/rnvs3rrSLwzn59Qc47u45+QqDNRpYz1cw0IboyH1MHjVjc0
 S+MPUCzyxM8cfEMmpj2XHm/kKnxVkIrLyDEFGc/97yqiWs5bXdZsZEsxwjxOVqdgOJqi
 /9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702804580; x=1703409380;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lbSaVhmyYdnzBKhQuQo4oOm2wwCddJ5JEF6JG+CBOso=;
 b=f+RRfyPZaAyuZUMIgS/Qh8suSDTVm7LGnYp4op39uqXevs4zMqxU1McucopKiC6wmY
 FeI3+5DFNUuwtKMVhi/UsVSgFwmGRYz4apRL/jkwF0dUuNb91eIDfZwhBM2DDHCZBXF/
 dTTTVAZko7kYjZyMPjdfahgr5t7XhCIWGftDbSKBWvTVTBUZrqIQ+vevIvQucZqZi5yb
 DI7XlNW7bf1EGNC2STgl7qVckIpgyCrj2NWJ3q+3G+B8h1dbptSRFrw5c704Of3pUKNp
 Y+tOqjL1pD4Nee3KY/ATF73qMG624cKXhQ4hPN5H3X8OsJpwfxtPhxd6wCZL3SDL5e6W
 5cJg==
X-Gm-Message-State: AOJu0YwGNH6dIrrALKT6uKDD5gWRE5fBE7r6uChcVYWbryiuNi2I91pC
 QybKzWe2W3aQMqXw5+C3Aqn4G5wXVzWqGLnvL54=
X-Google-Smtp-Source: AGHT+IHWOIfOlkls2hz3KVLlwe8JW+6pkguQ1zCX7LCxKZDQCCA11G0G/5+r6L2wIwK08YmDAXAa2IcIHeIQDTXrv3M=
X-Received: by 2002:a05:6214:1c4c:b0:67f:2541:1b6a with SMTP id
 if12-20020a0562141c4c00b0067f25411b6amr4585014qvb.17.1702804580557; Sun, 17
 Dec 2023 01:16:20 -0800 (PST)
MIME-Version: 1.0
References: <000000000000863a7305e722aeeb@google.com>
 <0000000000003362ba060ca8beac@google.com>
In-Reply-To: <0000000000003362ba060ca8beac@google.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sun, 17 Dec 2023 11:16:09 +0200
Message-ID: <CAOQ4uxjjo=qwwWcRXhv_D+KFfnPa_CEOrPbbZtzLroiOO7eYDg@mail.gmail.com>
To: syzbot <syzbot+8608bb4553edb8c78f41@syzkaller.appspotmail.com>
X-Spam-Score: 2.3 (++)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Sun, Dec 17, 2023 at 1:19 AM syzbot wrote: > > syzbot
    has bisected this issue to: > > commit c63e56a4a6523fcb1358e1878607d77a40b534bb
    > Author: Amir Goldstein > Date: Wed Aug 16 09:42:18 2023 [...] 
 
 Content analysis details:   (2.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.219.46 listed in list.dnswl.org]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [amir73il[at]gmail.com]
  2.5 SORTED_RECIPS          Recipient list is sorted by address
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.219.46 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rEnG6-0006zV-Gl
Subject: Re: [f2fs-dev] [syzbot] [reiserfs?] [squashfs?] BUG: Dentry still
 in use in unmount
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
Cc: squashfs-devel@lists.sourceforge.net, reiserfs-devel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, terrelln@fb.com,
 viro@zeniv.linux.org.uk, phillip@squashfs.org.uk,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gU3VuLCBEZWMgMTcsIDIwMjMgYXQgMToxOeKAr0FNIHN5emJvdAo8c3l6Ym90Kzg2MDhiYjQ1
NTNlZGI4Yzc4ZjQxQHN5emthbGxlci5hcHBzcG90bWFpbC5jb20+IHdyb3RlOgo+Cj4gc3l6Ym90
IGhhcyBiaXNlY3RlZCB0aGlzIGlzc3VlIHRvOgo+Cj4gY29tbWl0IGM2M2U1NmE0YTY1MjNmY2Ix
MzU4ZTE4Nzg2MDdkNzdhNDBiNTM0YmIKPiBBdXRob3I6IEFtaXIgR29sZHN0ZWluIDxhbWlyNzNp
bEBnbWFpbC5jb20+Cj4gRGF0ZTogICBXZWQgQXVnIDE2IDA5OjQyOjE4IDIwMjMgKzAwMDAKPgo+
ICAgICBvdmw6IGRvIG5vdCBvcGVuL2xsc2VlayBsb3dlciBmaWxlIHdpdGggdXBwZXIgc2Jfd3Jp
dGVycyBoZWxkCj4KPiBiaXNlY3Rpb24gbG9nOiAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5j
b20veC9iaXNlY3QudHh0P3g9MTM3MjNjMDFlODAwMDAKPiBzdGFydCBjb21taXQ6ICAgM2JkN2Q3
NDg4MTY5IE1lcmdlIHRhZyAnaW9fdXJpbmctNi43LTIwMjMtMTItMTUnIG9mIGdpdDovLy4uCj4g
Z2l0IHRyZWU6ICAgICAgIHVwc3RyZWFtCj4gZmluYWwgb29wczogICAgIGh0dHBzOi8vc3l6a2Fs
bGVyLmFwcHNwb3QuY29tL3gvcmVwb3J0LnR4dD94PTEwZjIzYzAxZTgwMDAwCj4gY29uc29sZSBv
dXRwdXQ6IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvbG9nLnR4dD94PTE3NzIzYzAx
ZTgwMDAwCj4ga2VybmVsIGNvbmZpZzogIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gv
LmNvbmZpZz94PTUzZWMzZGExZDI1OTEzMmYKPiBkYXNoYm9hcmQgbGluazogaHR0cHM6Ly9zeXpr
YWxsZXIuYXBwc3BvdC5jb20vYnVnP2V4dGlkPTg2MDhiYjQ1NTNlZGI4Yzc4ZjQxCj4gc3l6IHJl
cHJvOiAgICAgIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvcmVwcm8uc3l6P3g9MTdi
OGI2ZTFlODAwMDAKPiBDIHJlcHJvZHVjZXI6ICAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5j
b20veC9yZXByby5jP3g9MTZlYzc3M2FlODAwMDAKPgo+IFJlcG9ydGVkLWJ5OiBzeXpib3QrODYw
OGJiNDU1M2VkYjhjNzhmNDFAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQo+IEZpeGVzOiBjNjNl
NTZhNGE2NTIgKCJvdmw6IGRvIG5vdCBvcGVuL2xsc2VlayBsb3dlciBmaWxlIHdpdGggdXBwZXIg
c2Jfd3JpdGVycyBoZWxkIikKPgoKI3N5eiB0ZXN0OiBodHRwczovL2dpdGh1Yi5jb20vYW1pcjcz
aWwvbGludXggb3ZsLWZpeGVzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
